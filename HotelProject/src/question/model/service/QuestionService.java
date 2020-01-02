package question.model.service;

import java.sql.Connection;
import java.util.List;

import admin.model.dao.AdminDAO;

import static common.JDBCTemplate.*;

import question.model.dao.QuestionDAO;
import question.model.vo.Comment;
import question.model.vo.Question;

public class QuestionService {

	public List<Question> selectQuestion(String memberId) {

		Connection conn = getConnection();
		List<Question> qnaList = new QuestionDAO().selectQuestion(conn, memberId);
		close(conn);
		return qnaList;
	}

	public Question selectQuestionOne(int question_no) {
		Connection conn = getConnection();
		Question question = new QuestionDAO().selectQuestionOne(conn, question_no);
		close(conn);

		return question;
	}

	public Comment selectComment(int question_no) {

		Connection conn = getConnection();
		Comment comment = new QuestionDAO().selectComment(conn, question_no);
		close(conn);
		return comment;
	}

	public int insertQuestion(Question q) {
		Connection conn = getConnection();
		int result = new QuestionDAO().insertQuestion(conn, q);

		if (result > 0) {
			q.setQuestionNo(new QuestionDAO().selectLastSeq(conn));
			commit(conn);
		} else
			rollback(conn);

		close(conn);
		return result;
	}

	public int selectTotalContentByMemberId(String searchKeyword) {
		Connection conn = getConnection();
		int totalContent = new QuestionDAO().selectTotalContentByMemberId(conn, searchKeyword);
		close(conn);
		return totalContent;
	}

	public List<Question> selectQuestionByMemberId(String memberId, int cPage, int numPerPage) {
		List<Question> list = null;
		Connection conn = getConnection();
		list = new QuestionDAO().selectQuestionByMemberId(conn, memberId, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	/*문의사항 수정(지은)*/

	   public int updateQuestion(Question q) {
	      Connection conn = getConnection();
	      int result = new QuestionDAO().updateQuestion(conn, q);

	      if (result > 0) {
	         commit(conn);
	      } else
	         rollback(conn);

	      close(conn);
	      return result;
	   }

	   public int deleteQuestion(int question_no) {
	      Connection conn = getConnection();
	      int result = new QuestionDAO().deleteQuestion(conn,question_no);
	      if(result>0) commit(conn);
	      else rollback(conn);
	      close(conn);
	      return result;
	            
	   }
	

}
