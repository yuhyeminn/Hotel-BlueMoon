package question.controller;

import java.io.File;
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
@WebServlet("/mypage/qnaUpdateEnd")
public class QuestionUpdateEndServlet extends HttpServlet {
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
         int questionNo = Integer.parseInt(multiReq.getParameter("question_no"));
         //System.out.println("qnaNo@updateServlet======================================="+questionNo);
         String questionTitle = multiReq.getParameter("qnaTitle");
         String questionWriter = multiReq.getParameter("memberId");
         String questionCode = multiReq.getParameter("select");
         String questionContent = multiReq.getParameter("qnaContent");
         String originalFileName= multiReq.getOriginalFileName("upFile");  //사용자 업로드 파일명
         String renamedFileName = multiReq.getFilesystemName("upFile");  //실제 저장된 파일명
         
         ///기존첨부파일이 없는 경우
         ///기존첨부파일 정보: 파일이 없는 경우 ""값이 넘어온다.
         String oldOriginalFileName = multiReq.getParameter("oldOriginalFileName");
         String oldRenamedFileName = multiReq.getParameter("oldRenamedFileName");
         

         ///기존첨부파일이 있는 경우
         if(!"".equals(oldOriginalFileName)) {
            File f = multiReq.getFile("upFile");
            
            ///신규첨부파일 O, 기존첨부파일 삭제
            if(f != null) {
               File delFile = new File(saveDirectory,oldRenamedFileName);
               boolean result = delFile.delete();
//               System.out.println("기본첨부파일삭제: "+(result?"성공!":"실패!"));
            }
            ///신규첨부파일 X, 기존첨부파일 삭제
            else if(multiReq.getParameter("delFileChk")!=null) {
               File delFile = new File(saveDirectory,oldRenamedFileName);
               boolean result = delFile.delete();
//               System.out.println("기본첨부파일삭제: "+(result?"성공!":"실패!"));
            }
            ///신규첨부파일 없는 경우: 기존파일 유지
            else {
               originalFileName = oldOriginalFileName;
               renamedFileName = oldRenamedFileName;
            }
         }
         
         Question q = new Question(questionNo, questionCode, questionWriter, questionTitle, questionContent, null, originalFileName, renamedFileName, null);
         System.out.println("q@updateEndServlet="+q);
         
         //2.business logic
         int result = new QuestionService().updateQuestion(q);
         
         String msg = "";
         String loc = "/mypage/questionList?memberId="+questionWriter;

         if(result>0) {
            msg = "문의사항 수정에 성공하였습니다.";
         }
         else {
            msg = "문의사항 수정에 실패하였습니다.";
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