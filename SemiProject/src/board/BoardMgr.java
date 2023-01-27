package board;

import java.io.*;
import java.nio.Buffer;
import java.sql.*;
import java.util.ArrayList;
import db.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import org.apache.coyote.http11.filters.BufferedInputFilter;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	private DBConnectionMgr pool;
		// saveFolder 위치를 의미 ※ \\(역슬레시)를 사용하거나 /(슬레시)를 사용하거나
	private static final String SAVEFOLDER = "D:\\jspWork\\chap11\\src\\main\\webapp\\fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 5*1024*1024;
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
/*
	public void sample(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
*/
	
	
	
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;
		
		try {
			con = pool.getConnection();
				// File 클래스를 이용해 파일들을 저장 할 위치 = SAVEFOLDER;
			File file = new File(SAVEFOLDER);
				// !file.exists(); = 파일이 존재하지 않는다면
			if(!file.exists())
					// file.mkdir(); = 디렉토리를 만드세요. (단, File file = new File(SAVEFOLDER); 해당 위치에서 제대로 했다면 필요없는 작업!!)
				file.mkdir();
										// (가져오고, 저장 할 위치, 사이즈, 타입, 덮어쓰지 못하게 만드는 클래스)
			multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, 
					new DefaultFileRenamePolicy());
			
				// file이 있다면, 이름과 사이즈를 가져오는 코드
			if(multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
					// fileSize는 long형이다.
				filesize = (int)multi.getFile("filename").length();
			}
			
			sql = "insert into board values(seq_board.nextval,?,?,?,0,seq_board.currval,0,sysdate,?,?,0,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("subject"));
			pstmt.setString(3, multi.getParameter("content"));
			pstmt.setString(4, multi.getParameter("pass"));
			pstmt.setString(5, multi.getParameter("ip"));
			pstmt.setString(6, filename);
			pstmt.setInt(7, filesize);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
		// 기본 틀
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			
			if (keyWord.equals("null") || keyWord.equals("")) {
					// board에서 모든 행의 개수를 가져와라 라는 명령어
				sql = "SELECT COUNT(*) FROM BOARD";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "SELECT COUNT(*) FROM BOARD WHERE "+keyField+" LIKE ?";
				pstmt = con.prepareStatement(sql);
				/* pstmt.setString(1, keyField); */
				pstmt.setString(1, "%" + keyWord + "%");
			}
			
				// Query 실행해서 ResultSet에 저장해라 
			rs = pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;

	}
	
	public ArrayList<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ArrayList<BoardBean> alist = new ArrayList<BoardBean>();
		
		// DESC
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "SELECT BT2.* FROM (SELECT ROWNUM R1, BT1.* FROM (SELECT * FROM BOARD ORDER BY REF DESC, POS)BT1)BT2 WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "SELECT BT2.* FROM (SELECT ROWNUM R1, BT1.* FROM (SELECT * FROM BOARD ORDER BY REF DESC, POS)BT1 WHERE "+keyField+" LIKE ?)BT2 WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				/* pstmt.setString(1, keyField); */
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}

			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				alist.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	
	
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE BOARD SET COUNT = COUNT+1 WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		BoardBean bean = new BoardBean();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM BOARD WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setSubject(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setPos(rs.getInt(5));
				bean.setRef(rs.getInt(6));
				bean.setDepth(rs.getInt(7));
				bean.setRegdate(rs.getString(8));
				bean.setPass(rs.getString(9));
				bean.setIp(rs.getString(10));
				bean.setCount(rs.getInt(11));
				bean.setFilename(rs.getString(12));
				bean.setFilesize(rs.getInt(13));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
		// ★외워서 하는게 아니라 하나의 형태이다.
	public void downLoad(HttpServletRequest request, HttpServletResponse response, JspWriter out, PageContext pageContext) {
		try {
			String filename = request.getParameter("filename");
			File file = new File(UtilMgr.con(SAVEFOLDER+File.separator+filename));
			byte b[] = new byte[(int)file.length()];
			response.setHeader("Accept-Ranges", "bytes");
			String strClient = request.getHeader("User-Agent");
				// "MSIE6.0" = IE의 예전 버전
			if(strClient.indexOf("MSIE6.0") != -1) {
				response.setContentType("application/smnet; charset=UTF-8");
				response.setHeader("Content-Disposition", "filename=" + filename + ";");
			} else {
				response.setContentType("application/smnet; charset=UTF-8");
				response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
			}
			out.clear();
			out = pageContext.pushBody();
			if(file.isFile()) {
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;
				while((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
				fin.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE BOARD SET NAME=?, SUBJECT=?, CONTENT=? WHERE NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	public boolean deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT COUNT(*) FROM BOARD WHERE REF=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int result = rs.getInt(1);
				if(result == 1) {
					flag = true;
					sql = "SELECT filename FROM BOARD WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					if(rs.next() && rs.getString(1) != null) {
						File file = new File(SAVEFOLDER + "/" + rs.getString(1));
						if(file.exists())
							UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
					}
					
					sql = "DELETE FROM BOARD WHERE NUM = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 답변의 위치 값 증가
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE BOARD SET POS = POS+1 WHERE REF=? AND POS > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 답글 달기
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "insert into board values(seq_board.nextval,?,?,?,?,?,?,sysdate,?,?,0,null,null)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, pos);
			pstmt.setInt(5, bean.getRef());
			pstmt.setInt(6, depth);
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
/*
	public static void main(String[] args) {
		new BoardMgr().insert();
	}
	
	public void insert() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try { 
			con = pool.getConnection();
			sql = "INSERT INTO BOARD(num,name,subject,content,pos,ref,depth,regdate,count) "
					+ " values(?,'이름','제목','내용',0,?,0,'2022/12/08',0)";
			pstmt = con.prepareStatement(sql);
			for(int i = 15; i < 63; i++) {
				pstmt.setInt(1, i);
				pstmt.setInt(2, i);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
*/
	
	
}
