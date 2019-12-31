package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcFileRenamePolicy;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class NoticeFormEndServlet
 */
@WebServlet("/notice/noticeFormEnd")
public class NoticeFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 1.파일업로드 절차
	 * 	- 저장경로 
	 * 	- 파일용량제한
	 *  - 파일rename정책 : FileRenamePolicy
	 *  - MultipartReqeust객체생성: 파일입출력수행
	 * 2. 사용자입력값처리: MultipartRequest객체 
	 * 3. 업무로직처리
	 * 4. view단 위임
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파일이 저장될 절대경로 가져오기
		String saveDirectory
			= getServletContext().getRealPath("/upload/notice");// / 웹루트 WebContent
		System.out.println("saveDirectory="+saveDirectory);
		

		int maxPostSize = 1024 * 1024 * 10; 
		
		//파일명 재지정 정책 객체
		FileRenamePolicy mvcFileRenamePolicy
			= new MvcFileRenamePolicy();
		MultipartRequest multiReq = new MultipartRequest(request,
				 saveDirectory, 
				 maxPostSize, 
				 "utf-8",
				 mvcFileRenamePolicy);

		
		//1.parameter handling

		String noticeTitle = multiReq.getParameter("noticeTitle");
		String noticeWriter = multiReq.getParameter("noticeWriter");
		String noticeContent = multiReq.getParameter("noticeContent");
		
		//XSS공격대비&문자변환
		noticeContent = noticeContent.replaceAll("<", "&lt;")
									.replaceAll(">", "&gt")
									.replaceAll("\\n", "<br/>");
		
		System.out.println("noticeTitle="+noticeTitle);
		
		String noticeOriginalFileName 
			= multiReq.getOriginalFileName("upFile");//사용자 업로드한 파일명
		String noticeRenamedFileName
			= multiReq.getFilesystemName("upFile");//실제 저장된 파일명
		String noticeAvailable = multiReq.getParameter("noticeAvailable");
		
		Notice n = new Notice(0, noticeWriter, noticeTitle, noticeContent, null, 0, noticeOriginalFileName, noticeRenamedFileName, noticeAvailable);

		System.out.println("n@noticeFormEnd="+n);
		
		//2.business logic
		int result = new NoticeService().insertNotice(n);
		
		String msg = "";
		String loc = "/notice/noticeView?noticeNo="+n.getNoticeNo();
		
		if(result>0) {
			msg = "공지사항 등록 성공";
		}
		else {
			msg = "공지사항 등록 실패";
		}
		
		
		//3.view단 처리
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			   .forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
