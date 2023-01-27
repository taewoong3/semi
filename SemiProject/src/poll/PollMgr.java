package poll;

import java.sql.*;
import java.util.*;
import db.*;

public class PollMgr {
	private DBConnectionMgr pool;
	
	public PollMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	@SuppressWarnings("resource")
	public boolean insertPoll(PollListBean plBean, PollItemBean piBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO PollList VALUES(POLL_SEQ.NEXTVAL, ?, ?, ?, SYSDATE,?, DEFAULT)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, plBean.getQuestion());
			pstmt.setString(2, plBean.getSdate());
			pstmt.setString(3, plBean.getEdate());
			pstmt.setInt(4, plBean.getType());
			int result = pstmt.executeUpdate();
			int result2 = 0;
			
			if(result==1) {
				sql = "INSERT INTO pollitem VALUES(POLL_SEQ.CURRVAL,?,?,DEFAULT)";
				pstmt = con.prepareStatement(sql); // prepareStatement : DB에 SQL문을 실행할 수 있도록 보내주는 역할 ▒ ?(위치홀더) 원하는 위치에 원하는 값을 넣어줄 수 있는 기능이 있다.
				
				// item은 배열로 설정했으니까..
				String item[] = piBean.getItem();
				
				for(int i =0; i<item.length;i++) {
					if(item[i] == null || item[i].equals(""))
						break;
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);
					result2 = pstmt.executeUpdate();
				}
				if(result2 == 1)
					flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	public Vector<PollListBean> getAllList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<PollListBean> vlist = new Vector<PollListBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT NUM, QUESTION, TO_CHAR(SDATE, 'YYYY-MM-DD'), TO_CHAR(EDATE, 'YYYY-MM-DD') FROM pollList ORDER BY num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollListBean plBean = new PollListBean();
				plBean.setNum(rs.getInt(1));		// 첫 번째 컬럼 NUM
				plBean.setQuestion(rs.getString(2));
				plBean.setSdate(rs.getString(3));
				plBean.setEdate(rs.getString(4));
				vlist.add(plBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public PollListBean getList(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		PollListBean plBean = new PollListBean();
		
		try {
			con = pool.getConnection();
			if(num == 0)
				sql = "SELECT * FROM pollList ORDER BY num desc";
			else
				sql = "SELECT * FROM pollList WHERE num=" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				plBean.setQuestion(rs.getString("question"));
				plBean.setType(rs.getInt("type"));
				plBean.setActive(rs.getInt("active"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return plBean;
	}
	
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int maxNum = 0;
		
		try {
			con = pool.getConnection();
			sql = "SELECT MAX(num) FROM pollList";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	
	
	public Vector<String> getItem(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<String> vlist = new Vector<String>();
		
		try {
			con = pool.getConnection();
			if(num == 0)
				num = getMaxNum();
			
			sql = "SELECT item FROM PollItem WHERE listnum =" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vlist.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public boolean updatePoll(int num, String[] itemnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE pollitem set count = count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) 
				num = getMaxNum();
			
			for(int i = 0; i < itemnum.length; i++) {
				if(itemnum[i] == null || itemnum[i].equals(""))
					break;
				 
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				int j = pstmt.executeUpdate();
				if(j > 0)
					flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	public int sumCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "SELECT SUM(count) FROM pollitem WHERE listnum = ?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) 
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	
	
	public Vector<PollItemBean> getView(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<PollItemBean> vlist = new Vector<PollItemBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT item, count FROM pollitem WHERE listnum = ?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) 
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PollItemBean piBean = new PollItemBean();
				String[] item = new String[1];
				item[0] = rs.getString(1);
				piBean.setItem(item);
				piBean.setCount(rs.getInt(2));
				vlist.add(piBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	
	
	
}
