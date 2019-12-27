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
		String query = prop.getProperty("selectNoticeAll");
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
		
		return null;
	}

	public int increaseReadCount(Connection conn, int noticeNo) {
		return 0;
	}

}
