package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import review.model.dao.ReviewDAO;
import review.model.vo.ReviewM;

public class ReviewService {
	
	public List<ReviewM> selectReviewbyRoomNo(int roomNo) {
		Connection conn = getConnection();
		List<ReviewM> list 
			= new ReviewDAO().selectReviewbyRoomNo(conn, roomNo);
		close(conn);
		return list;
	}

	public List<ReviewM> selectReviewList(int cPage, int numPerPage, int roomNo) {
		Connection conn = getConnection();
		List<ReviewM> list 
			= new ReviewDAO().selectReviewList(conn, cPage, numPerPage, roomNo);
		close(conn);
		return list;
	}

	public int selectReviewCount(int roomNo) {
		Connection conn = getConnection();
		int totalContent = new ReviewDAO().selectReviewCount(conn, roomNo);
		close(conn);
		return totalContent;
	}

}





