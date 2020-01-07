package question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.MvcFileRenamePolicy;
import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class QuestionUpdateServlet
 */
@WebServlet("/mypage/UpdateQuestion")
public class QuestionUpdateFormServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int question_no = Integer.parseInt(request.getParameter("qnaNo"));
      String question_writer = request.getParameter("question_writer");
      System.out.println("업데이트에서 멤버아이디="+question_writer);
      
      Question question = new QuestionService().selectQuestionOne(question_no, question_writer);
      
      request.setAttribute("question", question);

      request.getRequestDispatcher("/WEB-INF/views/qna/qnaUpdateForm.jsp").forward(request, response);
   }   
   

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}