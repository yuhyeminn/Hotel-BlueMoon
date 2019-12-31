package notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sun.javafx.geom.transform.GeneralTransform3D;

import notice.model.vo.Notice;
import static common.JDBCTemplate.*;

public class NoticeDAO {
	private Properties prop = new Properties();

	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Notice> selectNoticeAll(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectNoticeAllByPage");
		List<Notice> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			//공식1
			pstmt.setInt(1, (cPage-1)*numPerPage+1);//start rownum
			pstmt.setInt(2, cPage*numPerPage);//end rownum
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeReadCount(rset.getInt("notice_readcount"));
				n.setNoticeOriginalFileName(rset.getString("notice_original_filename"));
				n.setNoticeRenamedFileName(rset.getString("notice_renamed_filename"));
				n.setNoticeAvailable(rset.getString("notice_available"));
				
				list.add(n);
			}
			System.out.println("noticelist@dao="+list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectNoticeCount");
		int totalContent = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next())
				totalContent = rset.getInt("cnt");
			
			System.out.println("totalContent@dao="+totalContent);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}

	public Notice selectNoticeOne(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectNoticeOne"); 
		Notice n = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeReadCount(rset.getInt("notice_readcount"));
				n.setNoticeOriginalFileName(rset.getString("notice_original_filename"));
				n.setNoticeRenamedFileName(rset.getString("notice_renamed_filename"));
				n.setNoticeAvailable(rset.getString("notice_available"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int increaseReadCount(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("increaseReadCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertNotice");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeWriter());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContent());
			pstmt.setString(4, n.getNoticeOriginalFileName());
			pstmt.setString(5, n.getNoticeRenamedFileName());

			result = pstmt.executeUpdate();
			
			System.out.println("insert@dao="+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

	public int selectLastSeq(Connection conn) {
		int noticeNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectLasSeq");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				noticeNo = rset.getInt("currval");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noticeNo;
	}

	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeOriginalFileName());
			pstmt.setString(4, n.getNoticeRenamedFileName());
			pstmt.setInt(5, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);		
			}
		
		return result;
	}

	public List<Notice> selectNoticeAll(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectNoticeAll");
		List<Notice> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeReadCount(rset.getInt("notice_readcount"));
				n.setNoticeOriginalFileName(rset.getString("notice_original_filename"));
				n.setNoticeRenamedFileName(rset.getString("notice_renamed_filename"));
				n.setNoticeAvailable(rset.getString("notice_available"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public List<Notice> selectNoticeSearch(Connection conn,String noticeSearch, String searchType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="";
		
		List<Notice> list = new ArrayList<>();
		if("title".equals(searchType)) query = prop.getProperty("selectNoticeSearchByTitle");
		else if("content".equals(searchType)) query = prop.getProperty("selectNoticeSearchByContent");
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%"+noticeSearch+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeReadCount(rset.getInt("notice_readcount"));
				n.setNoticeOriginalFileName(rset.getString("notice_original_filename"));
				n.setNoticeRenamedFileName(rset.getString("notice_renamed_filename"));
				n.setNoticeAvailable(rset.getString("notice_available"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}





}
