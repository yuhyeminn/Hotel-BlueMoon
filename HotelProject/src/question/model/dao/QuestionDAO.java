package question.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.dao.MemberDAO;
import question.model.vo.Comment;
import question.model.vo.Question;

public class QuestionDAO {

	private Properties prop = new Properties();

	public QuestionDAO() {
		String fileName = MemberDAO.class.getResource("/sql/question/question-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Question> selectQuestion(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Question> qnaList = null;
		String query = prop.getProperty("selectQuestion");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);

			rset = pstmt.executeQuery();

			qnaList = new ArrayList<>();

			while (rset.next()) {
				Question q = new Question();
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionCode(rset.getString("question_name"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionOriginalFileName(rset.getString("question_originalFileName"));
				q.setQuestionRenamedFileName(rset.getString("question_renamedFileName"));
				q.setQuestionAnswer(rset.getString("question_answer"));

				qnaList.add(q);
			}

			// System.out.println("qnaList@DAO="+qnaList);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return qnaList;
	}

	public Question selectQuestionOne(Connection conn, int question_no) {
		PreparedStatement pstmt = null;
		Question q = new Question();
		ResultSet rset = null;
		String query = prop.getProperty("selectQuestionOne");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, question_no);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionCode(rset.getString("question_name"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionOriginalFileName(rset.getString("question_originalFileName"));
				q.setQuestionRenamedFileName(rset.getString("question_renamedFileName"));
				q.setQuestionAnswer(rset.getString("question_answer"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}

	public Comment selectComment(Connection conn, int question_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Comment c = null;
		String query = prop.getProperty("selectComment");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, question_no);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				c = new Comment();
				c.setCommentNo(rset.getInt("comment_no"));
				c.setQuestionRef(rset.getInt("question_ref"));
				c.setCommentWriter(rset.getString("comment_writer"));
				c.setCommentContent(rset.getString("comment_content"));
				c.setCommentDate(rset.getDate("comment_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}

	public int insertQuestion(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertQuestion");
		int result = 0;

		// insert into question_board values(seq_question_no.nextval, ?, ?, ?, ?,
		// default, null, null, default);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getQuestionWriter());
			pstmt.setString(2, q.getQuestionCode());
			pstmt.setString(3, q.getQuestionTitle());
			pstmt.setString(4, q.getQuestionContent());
			pstmt.setString(5, q.getQuestionOriginalFileName());
			pstmt.setString(6, q.getQuestionRenamedFileName());

			result = pstmt.executeUpdate();

			System.out.println("result@dao=" + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectLastSeq(Connection conn) {
		int questionNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectLastSeq");

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				questionNo = rset.getInt("currval");
			}
			System.out.println(questionNo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return questionNo;
	}

	public int selectTotalContentByMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTotalContentByMemberId");
		int totalContent = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			

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

	public List<Question> selectQuestionByMemberId(Connection conn, String memberId, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Question> list = null;
		String query = prop.getProperty("selectQuestionByMemberIdByPaging");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);// start rownum
			pstmt.setInt(3, cPage * numPerPage);// end rownum

			rset = pstmt.executeQuery();

			list = new ArrayList<>();
			while (rset.next()) {
				Question q = new Question();
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionCode(rset.getString("question_name"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionOriginalFileName(rset.getString("question_originalFileName"));
				q.setQuestionRenamedFileName(rset.getString("question_renamedFileName"));
				q.setQuestionAnswer(rset.getString("question_answer"));

				list.add(q);
			}
			System.out.println("memberQnAList@DAO="+list);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

}
