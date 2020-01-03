package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import member.model.dao.MemberDAO;
import member.model.vo.Member;
import question.model.vo.Comment;
import question.model.vo.Question;
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

	public int selectTotalContent() {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContent(conn);
		close(conn);
		return totalContent;
	}

	public int selectTotalContentByMemberId(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContentByMemberId(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int selectTotalContentByQuestionName(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContentByQuestionName(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public int selectTotalContentByAnswer(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new AdminDAO().selectTotalContentByAnswer(conn, searchKeyword);
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

}





