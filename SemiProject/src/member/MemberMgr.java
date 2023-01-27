package member;

import java.sql.*;
import java.util.Vector;

import db.*;
import poll.PollListBean;

public class MemberMgr {
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();	// 인스턴스 만들기!
	}
	
	public String loginMember(String id, String pwd) {
		Connection con = null;		// 연결
		PreparedStatement pstmt = null;	// DB와 연결된 곳에 () 입력값을 전달해주는 역할
		ResultSet rs = null;	// ★ 축출한 데이터 저장
		String sql = null;
		boolean flag = false;
		String name = null;
		try {
			con = pool.getConnection();
			sql = "SELECT name FROM MEMBER WHERE id=? AND pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();	// 반드시 저장은 ResultSet에 해야한다.
			if(rs.next()) {
				name=rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return name;
	}
	
	
	
	
/*
 
	public boolean loginMember(String id, String pwd) {
		Connection con = null;		// 연결
		PreparedStatement pstmt = null;	// DB와 연결된 곳에 () 입력값을 전달해주는 역할
		ResultSet rs = null;	// ★ 축출한 데이터 저장
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT id FROM MEMBER WHERE id=? AND pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();	// 반드시 저장은 ResultSet에 해야한다.
			flag = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

*/
	
	public boolean checkId(String id) {
		Connection con = null;		// 연결
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	// 축출한 데이터 저장
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT id FROM MEMBER WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	public boolean insertMember(MemberBean bean) {
		Connection con = null;		// 연결
		PreparedStatement pstmt = null;	// 데이터 축출
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetailAddress());
			
//			String hobby[] = bean.getHobby();
//			char hb[] = {'0','0','0','0','0'};
//			String lists[] = {"internet", "travel", "game", "movie", "exercise"};
//			for(int i = 0; i< hobby.length; i++) {
//				for(int j = 0; j < lists.length; j++) {
//					if(hobby[i].equals(lists[j])) {
//						hb[j] = '1';
//					}
//				}
//			}
			
//			pstmt.setString(10, new String(hb));
//			pstmt.setString(11, bean.getJob());
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
