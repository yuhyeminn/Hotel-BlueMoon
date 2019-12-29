package admin.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;
import member.model.vo.Member;
import question.model.vo.Comment;
import question.model.vo.Question;

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



}





