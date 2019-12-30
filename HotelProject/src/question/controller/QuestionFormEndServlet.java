package question.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class QuestionFormEndServlet
 */
@WebServlet("/mypage/questionFormEnd")
public class QuestionFormEndServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //파일업로드시 저장될 경로 가져오기
      String saveDirectory = getServletContext().getRealPath("/upload/question");
      
      //파일 최대 업로드 크기 제한: 10MB
      int maxPostSize = 1024 * 1024 * 10;
      
      //파일이름 재 지정 정책 객체 
      FileRenamePolicy mvcFileRenamePolicy = new MvcFileRenamePolicy();
      MultipartRequest multiReq = new MultipartRequest(request,saveDirectory,maxPostSize,"utf-8",mvcFileRenamePolicy);
      
      //1.parameter handling
      String questionTitle = multiReq.getParameter("qnaTitle");
      String questionWriter = multiReq.getParameter("memberId");
      String questionCode = multiReq.getParameter("select");
      String questionContent = multiReq.getParameter("qnaContent");
      String originalFileName= multiReq.getOriginalFileName("upFile");  //사용자 업로드 파일명
      String renamedFileName = multiReq.getFilesystemName("upFile");  //실제 저장된 파일명

      Question q = new Question(0, questionCode, questionWriter, questionTitle, questionContent, null, originalFileName, renamedFileName, null);
      System.out.println("q@questionFormEnd="+q);
      
      //2.business logic
      int result = new QuestionService().insertQuestion(q);
      
      String msg = "";
      String loc = "/mypage/questionList?memberId="+questionWriter;
      
      if(result>0) {
         msg = "문의사항 등록 완료";
      }
      else {
         msg = "문의사항 등록에 실패. 관리자에게 문의하세요.";
      }
      
      //3.view단 처리 
      request.setAttribute("msg", msg);
      request.setAttribute("loc", loc);
      request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}