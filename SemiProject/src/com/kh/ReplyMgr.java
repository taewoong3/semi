package com.kh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyMgr {
	private DBConnectionMgr pool;
	
	public ReplyMgr() {
		pool = DBConnectionMgr.getInstance();	// 인스턴스 만들기!
	}
	
	public ArrayList<ReplyBean> getAllMember(int num) {
		Connection con = null;		// 연결
		PreparedStatement pstmt = null;	// 데이터 축출
		ResultSet rs = null;	// 축출한 데이터 저장
		String sql = null;
		ArrayList<ReplyBean> alist = new ArrayList<ReplyBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM REPLY WHERE REF=? ORDER BY NO DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				alist.add(new ReplyBean(rs.getInt("no"),
							  			rs.getString("content"),
							  			rs.getInt("ref"),
							  			rs.getString("name"),
							  			rs.getString("redate")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	
	public int insertReply(ReplyBean bean) {
		Connection con = null;			// 연결
		PreparedStatement pstmt = null;	// 데이터 축출
		String sql = null;
		int result = 0;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO REPLY VALUES(SEQ_REPLY.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setInt(2, bean.getRef());
			pstmt.setString(3, bean.getName());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	
		}
}
