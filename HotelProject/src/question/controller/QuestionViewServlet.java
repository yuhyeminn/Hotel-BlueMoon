package question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;
import question.model.vo.Comment;
import question.model.vo.Question;

/**
 * Servlet implementation class QuestionViewServlet
 */
@WebServlet("/mypage/questionView")
public class QuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int question_no = Integer.parseInt(request.getParameter("question_no"));
		//System.out.println("question_no@servlet="+question_no);
		String question_writer = request.getParameter("question_writer");
		System.out.println("!!!question_writer@servlet="+question_writer);
		
		Question question = new QuestionService().selectQuestionOne(question_no, question_writer);
		Comment comment = new QuestionService().selectComment(question_no);
		
		request.setAttribute("question", question);
		request.setAttribute("comment", comment);
		
		request.getRequestDispatcher("/WEB-INF/views/qna/qnaView.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
