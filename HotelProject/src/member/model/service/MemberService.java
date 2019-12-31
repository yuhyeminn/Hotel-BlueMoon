package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import member.model.dao.MemberDAO;
import member.model.vo.Member;
import review.model.vo.Review;
import review.model.vo.ReviewN;
import review.model.vo.ReviewNN;
import room.model.vo.Room;

public class MemberService {

	public Member selectOne(String memberId) {
		Connection conn = getConnection();
		
		Member m = new MemberDAO().selectOne(conn, memberId);
		close(conn);
		return m;
	}


	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().insertMember(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().updateMember(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		int result = new MemberDAO().deleteMember(conn, memberId);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	public int updatePassword(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().updatePassword(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	public Member selectMemberId(Member m) {
		Connection conn = getConnection();
		Member member = new MemberDAO().selectMemberId(conn, m);
		close(conn);
		return member;
		
	}

	public Member selectMemberPW(Member m) {
		Connection conn = getConnection();
		Member member = new MemberDAO().selectMemberPW(conn, m);
		close(conn);
		return member;
	}

	public Member selectMemberByEmail(String email) {
		Connection conn = getConnection();
		Member m = new MemberDAO().selectMemberByEmail(conn, email);
		close(conn);
		return m;
	}
	
	public List<ReviewN> selectReviewN(String memberId) {
		Connection conn = getConnection();
		List<ReviewN> list 
			= new MemberDAO().selectReviewN(conn, memberId);
		close(conn);
		return list;
	}


	public List<ReviewNN> selectReviewNN(String memberId) {
		Connection conn = getConnection();
		List<ReviewNN> list = new MemberDAO().selectReviewNN(conn, memberId);
		close(conn);
		return list;
	}


	public int insertReview(Review review) {
		Connection conn = getConnection();
		int result = new MemberDAO().insertReview(conn, review);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	public int deleteReview(int reviewNo) {
		Connection conn = getConnection();
		int result = new MemberDAO().deleteReview(conn, reviewNo);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	
}
