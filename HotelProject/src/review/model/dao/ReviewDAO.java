package review.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.vo.Member;
import question.model.vo.Comment;
import question.model.vo.Question;
import review.model.vo.Review;
import review.model.vo.ReviewM;
import review.model.vo.ReviewN;
import room.model.vo.Room;

public class ReviewDAO {

	private Properties prop = new Properties();

	public ReviewDAO() {
		try {
			// 클래스객체 위치찾기 : 절대경로를 반환한다.
			String fileName = ReviewDAO.class.getResource("/sql/review/review-query.properties").getPath();
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<ReviewM> selectReviewbyRoomNo(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReviewbyRoomNo");
		List<ReviewM> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ReviewM r = new ReviewM();
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewWriter(rset.getString("review_writer"));
				r.setResvNo(rset.getLong("resv_no"));
				r.setRoomNo(rset.getInt("room_no"));
				r.setReviewContent(rset.getString("review_content"));
				r.setReviewDate(rset.getDate("review_date"));
				r.setReviewStarClean(rset.getInt("review_starClean"));
				r.setReviewStarComm(rset.getInt("review_starComm"));
				r.setReviewStarCheckIn(rset.getInt("review_starCheckIn"));
				r.setReviewStarLocation(rset.getInt("review_starLocation"));
				r.setReviewStarValue(rset.getInt("review_starValue"));
				r.setMemberName(rset.getString("member_name"));
				
				list.add(r);
			}
			System.out.println("selectReviewbyRoomNo@dao=" + list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public List<ReviewM> selectReviewList(Connection conn, int cPage, int numPerPage, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReviewList");
		List<ReviewM> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);// end rownum
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);// start rownum
			pstmt.setInt(3, cPage * numPerPage);// end rownum

			rset = pstmt.executeQuery();

			while (rset.next()) {
				ReviewM r = new ReviewM();
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewWriter(rset.getString("review_writer"));
				r.setResvNo(rset.getLong("resv_no"));
				r.setRoomNo(rset.getInt("room_no"));
				r.setReviewContent(rset.getString("review_content"));
				r.setReviewDate(rset.getDate("review_date"));
				r.setReviewStarClean(rset.getInt("review_starClean"));
				r.setReviewStarComm(rset.getInt("review_starComm"));
				r.setReviewStarCheckIn(rset.getInt("review_starCheckIn"));
				r.setReviewStarLocation(rset.getInt("review_starLocation"));
				r.setReviewStarValue(rset.getInt("review_starValue"));
				r.setMemberName(rset.getString("member_name"));

				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int selectReviewCount(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReviewCount");
		int totalContent = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);// end rownum
			rset = pstmt.executeQuery();

			if (rset.next())
				totalContent = rset.getInt("cnt");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContent;
	}

	public List<ReviewM> selectReviewListByContent(Connection conn, int cPage, int numPerPage, int roomNo,
			String rvSrch) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReviewListByContent");
		List<ReviewM> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);// 
			pstmt.setString(2, "%"+rvSrch+"%"); 
			pstmt.setString(3, "%"+rvSrch+"%");
			pstmt.setInt(4, (cPage - 1) * numPerPage + 1);// start rownum
			pstmt.setInt(5, cPage * numPerPage);// end rownum

			rset = pstmt.executeQuery();

			while (rset.next()) {
				ReviewM r = new ReviewM();
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewWriter(rset.getString("review_writer"));
				r.setResvNo(rset.getLong("resv_no"));
				r.setRoomNo(rset.getInt("room_no"));
				r.setReviewContent(rset.getString("review_content"));
				r.setReviewDate(rset.getDate("review_date"));
				r.setReviewStarClean(rset.getInt("review_starClean"));
				r.setReviewStarComm(rset.getInt("review_starComm"));
				r.setReviewStarCheckIn(rset.getInt("review_starCheckIn"));
				r.setReviewStarLocation(rset.getInt("review_starLocation"));
				r.setReviewStarValue(rset.getInt("review_starValue"));
				r.setMemberName(rset.getString("member_name"));

				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int selectTotalContentByContent(Connection conn, String rvSrch, int roomNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContentByContent");
		int totalContent = 0;

		System.out.println(query);
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			pstmt.setString(2, "%"+rvSrch+"%");
			pstmt.setString(3, "%"+rvSrch+"%");
			
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

	public int selectTotalContentReview(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContentReview");
		int totalContent = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalContent = rset.getInt("cnt");
			}
			
			System.out.println("totalContent@dao="+totalContent);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return totalContent;
	}

}
