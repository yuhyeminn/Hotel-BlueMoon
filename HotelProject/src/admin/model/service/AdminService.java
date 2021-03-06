package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import coupon.model.vo.Coupon;
import coupon.model.vo.CouponKind;
import member.model.vo.Member;
import question.model.vo.Comment;
import question.model.vo.Question;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationCount;
import review.model.vo.Review;
import room.model.vo.Room;

public class AdminService {
	
    public List<Question> selectQuestionList(int cPage, int numPerPage) {
        Connection conn = getConnection();
        List<Question> list= new AdminDAO().selectQuestionList(conn, cPage, numPerPage);
        close(conn);
        return list;
    }

	public List<Question> selectQuestionByMemberId(String searchKeyword, 
											   int cPage, 
											   int numPerPage) {
		List<Question> list = null;
		Connection conn = getConnection();
		list = new AdminDAO().selectQuestionByMemberId(conn, searchKeyword, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public List<Question> selectQuestionByMemberName(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Question> list = new AdminDAO().selectQuestionByQuestionName(conn, searchKeyword, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<Question> selectQuestionByGender(String searchKeyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Question> list = new AdminDAO().selectQuestionByAnswer(conn, searchKeyword, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectTotalQnAContent() {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalQnAContent(conn);
		close(conn);
		return totalContent;
	}

	public int selectTotalQnAContentByMemberId(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalQnAContentByMemberId(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int selectTotalQnAContentByQuestionName(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalQnAContentByQuestionName(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int selectTotalQnAContentByAnswer(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalQnAContentByAnswer(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int deleteQuestion(int qnaNo) {

		Connection conn = getConnection();
		int result = new AdminDAO().deleteQuestion(conn, qnaNo);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

			
	public int insertRoom(Room r) {
		Connection conn = getConnection();
		int result = new AdminDAO().insertRoom(conn, r);
		//트랜잭션 처리
		if(result>0) 
			commit(conn);
		else 
			rollback(conn);
		close(conn);

		return result;
	}

	public int insertComment(Comment c) {
		Connection conn = getConnection();
		
		int result = new AdminDAO().insertComment(conn, c);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public int updateCommnet(Comment c) {
		Connection conn = getConnection();
		
		int result = new AdminDAO().updateCommnet(conn, c);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}


	public List<Room> selectRoomList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Room> list 
			= new AdminDAO().selectRoomList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectRoomCount() {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectRoomCount(conn);
		close(conn);
		return totalContent;
	}

	public int deleteRoom(String roomName) {
		Connection conn = getConnection();
		int result = new AdminDAO().deleteRoom(conn, roomName);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public List<Room> selectAllRoomList() {
		Connection conn = getConnection();
		List<Room> list = new AdminDAO().selectAllRoomList(conn);
		close(conn);
		return list;
	}

	public Room selectOne(int roomNo) {
		Connection conn = getConnection();
		Room r = new AdminDAO().selectOne(conn, roomNo);
		close(conn);
		return r;
	
	}

	
	public List<ReservationCount> selectResvCountYear() {
		Connection conn = getConnection();
		List<ReservationCount> rcYearList = new AdminDAO().selectResvCountYear(conn);
		close(conn);
		return rcYearList;
	}

	public List<ReservationCount> selectMonth() {
		Connection conn = getConnection();
		List<ReservationCount> selectMonth = new AdminDAO().selectMonth(conn);
		System.out.println("selectMonth@service="+selectMonth);
		close(conn);
		return selectMonth;
	}

//	public List<ReservationCount> select2020Month() {
//		Connection conn = getConnection();
//		List<ReservationCount> month2020List = new AdminDAO().select2020Month(conn);
//		System.out.println("month2020List@service="+month2020List);
//		close(conn);
//		return month2020List;
//	}

	public int updateRoomByRoomNo(Room r) {
		Connection conn = getConnection();
		int result = new AdminDAO().updateRoomByRoomNo(conn, r);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
		
	}
	
	 public List<Member> selectMemberList(int cPage, int numPerPage) {
	        Connection conn = getConnection();
	        List<Member> list= new AdminDAO().selectMemberList(conn, cPage, numPerPage);
	        close(conn);
	        return list;
	        
	    }
	 
	    public List<Reservation> selectReservationList(int cPage, int numPerPage) {
	    	Connection conn = getConnection();
	    	List<Reservation> list= new AdminDAO().selectReservationList(conn, cPage, numPerPage);
	    	close(conn);
	    	return list;
	    }
	    public List<Review> selectReviewList(int cPage, int numPerPage) {
	    	Connection conn = getConnection();
	    	List<Review> list= new AdminDAO().selectReviewList(conn, cPage, numPerPage);
	    	close(conn);
	    	return list;
	    }
	    
		public List<Coupon> selectCouponList(int cPage, int numPerPage) {
			Connection conn = getConnection();
	    	List<Coupon> list= new AdminDAO().selectCouponList(conn, cPage, numPerPage);
	    	close(conn);
	    	return list;
		}
		public List<CouponKind> selectCouponKindList(int cPage, int numPerPage) {
			Connection conn = getConnection();
	    	List<CouponKind> list= new AdminDAO().selectCouponKindList(conn, cPage, numPerPage);
	    	close(conn);
	    	return list;
		}
		
		public int selectTotalMemberContent() {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalMemberContent(conn);
			close(conn);
			return totalContent;
		}
		public int selectTotalReviewContent() {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalReviewContent(conn);
			close(conn);
			return totalContent;
		}
		public int selectTotalResvContent() {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalResvContent(conn);
			close(conn);
			return totalContent;
		}
		public int selectTotalCpnContent() {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalCpnContent(conn);
			close(conn);
			return totalContent;
		}
		public int selectTotalCpnKindContent() {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalCpnKindContent(conn);
			close(conn);
			return totalContent;
		}
		public int createCoupon(CouponKind ck) {
			Connection conn = getConnection();
			int result = new AdminDAO().createCoupon(conn, ck);
			if(result>0)
				commit(conn);
			else 
				rollback(conn);
			close(conn);
			return result;
		}
		public int deleteMember(String memberId) {
			Connection conn = getConnection();
			int result = new AdminDAO().deleteMember(conn, memberId);
			if(result>0)
				commit(conn);
			else 
				rollback(conn);
			close(conn);
			
			return result;
		}
		public long deleteReservation(long resvNo) {
			Connection conn = getConnection();
			long result = new AdminDAO().deleteReservation(conn, resvNo);
			if(result>0)
				commit(conn);
			else 
				rollback(conn);
			close(conn);
			
			return result;
		}
		public int deleteCouponKind(int couponCode) {
			Connection conn = getConnection();
			int result = new AdminDAO().deleteCouponKind(conn, couponCode);
			if(result>0)
				commit(conn);
			else 
				rollback(conn);
			close(conn);
			
			return result;
		}
		public int deleteReview(String rvWriter) {
			Connection conn = getConnection();
			int result = new AdminDAO().deleteReview(conn, rvWriter);
			if(result>0)
				commit(conn);
			else 
				rollback(conn);
			close(conn);
			
			return result;
		}
		
		//항목별 검색
		public List<Member> selectMemberByMemberId(String searchKeyword, int cPage, int numPerPage) {
			List<Member> list = null;
			Connection conn = getConnection();
			list = new AdminDAO().selectMemberByMemberId(conn, searchKeyword, cPage, numPerPage);
			close(conn);
			return list;
		}

		public List<Member> selectMemberByMemberName(String searchKeyword, int cPage, int numPerPage) {
			List<Member> list = null;
			Connection conn = getConnection();
			list = new AdminDAO().selectMemberByMemberName(conn, searchKeyword, cPage, numPerPage);
			close(conn);
			return list;		
		}

		public int selectTotalMemberContentByMemberId(String searchKeyword) {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalMemberContentByMemberId(conn, searchKeyword);
			close(conn);
			return totalContent;
		}

		public int selectTotalMemberContentByMemberName(String searchKeyword) {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalMemberContentByMemberName(conn, searchKeyword);
			close(conn);
			return totalContent;
		}

		public List<Reservation> selectResvByMemberId(String searchKeyword, int cPage, int numPerPage) {
			List<Reservation> list = null;
			Connection conn = getConnection();
			list = new AdminDAO().selectResvByMemberId(conn, searchKeyword, cPage, numPerPage);
			close(conn);
			return list;
		}

		public int selectTotalResvContentByMemberId(String searchKeyword) {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalResvContentByMemberId(conn, searchKeyword);
			close(conn);
			return totalContent;
		}

		public int selectTotalCpnContentByMemberId(String memberId) {
			Connection conn = getConnection();
			int totalContent = new AdminDAO().selectTotalCpnContentByMemberId(conn, memberId);
			close(conn);
			return totalContent;
		}

		public List<Coupon> selectCouponByMemberIdByPaging(String memberId, int cPage, int numPerPage) {
			List<Coupon> list = null;
			Connection conn = getConnection();
			list = new AdminDAO().selectCouponByMemberIdByPaging(conn, memberId, cPage, numPerPage);
			close(conn);
			return list;
		}

		

		

}





