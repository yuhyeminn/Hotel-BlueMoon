package admin.controller;

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
 * Servlet implementation class AdminQnAViewServlet
 */
@WebServlet("/admin/questionView")
public class AdminQnAViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int question_no = Integer.parseInt(request.getParameter("question_no"));
		System.out.println("question_no@servlet="+question_no);
		
		Question question = new QuestionService().selectQuestionOne(question_no);
		Comment comment = new QuestionService().selectComment(question_no);
		
		request.setAttribute("question", question);
		request.setAttribute("comment", comment);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/adminQnAView.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
