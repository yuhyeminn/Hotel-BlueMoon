package question.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.model.service.QuestionService;

/**
 * Servlet implementation class QuestionDeleteServlet
 */
@WebServlet("/mypage/DeleteQuestion")
public class QuestionDeleteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int questionNo = Integer.parseInt(request.getParameter("qnaNo"));
//      System.out.println("QuestionDeleteServlet="+questionNo);
      String qnaWriter = request.getParameter("qnaWriter");
      
      int result = new QuestionService().deleteQuestion(questionNo);

       String view = "/WEB-INF/views/common/msg.jsp";
      String msg = "";
      String loc = "/";
      
      if(result>0) {
         msg="문의게시글을 성공적으로 삭제했습니다.";
           loc = "/mypage/questionList?memberId="+qnaWriter;
         
      }else {
         msg="문의게시글 삭제에 실패했습니다.";
         loc = "/mypage/questionView?question_no="+questionNo;
      }
      
      request.setAttribute("msg", msg);
      request.setAttribute("loc", loc);
      
      RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
      reqDispatcher.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}