package notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.MvcFileRenamePolicy;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/notice/noticeUpdateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDirectory = getServletContext().getRealPath("/upload/notice");
		
		int maxPostSize = 1024*1024*10;
		
		FileRenamePolicy mvcFileRenamePolicy
		= new MvcFileRenamePolicy();
		MultipartRequest multiReq = new MultipartRequest(request,
													 saveDirectory, 
													 maxPostSize, 
													 "utf-8",
													 mvcFileRenamePolicy);
		
		int noticeNo = Integer.parseInt(multiReq.getParameter("noticeNo"));
		String noticeTitle = multiReq.getParameter("noticeTitle");
		String noticeWriter = multiReq.getParameter("noticeWriter");
		String noticeContent = multiReq.getParameter("noticeContent");
		
		String noticeOriginalFileName 
		= multiReq.getOriginalFileName("upFile");//사용자 업로드한 파일명
		String noticeRenamedFileName
		= multiReq.getFilesystemName("upFile");//실제 저장된 파일명
		
		String noticeAvailable = multiReq.getParameter("noticeAvailable");
		
		String oldOriginalFileName = 
				multiReq.getParameter("oldOriginalFileName");
		String oldRenamedFileName = 
				multiReq.getParameter("oldRenamedFileName");
		
		if(!"".equals(oldOriginalFileName)) {
			//신규첨부파일 유무 검사: upFile파일첨부가 없는 경우, null을 리턴
			File f = multiReq.getFile("upFile");
			
			//신규첨부파일이 있는 경우, 기존첨부파일 삭제
			if(f != null) {
				File delFile = new File(saveDirectory, oldRenamedFileName);
				boolean result = delFile.delete();
				System.out.println("기존첨부파일삭제 "+(result?"성공":"실패"));
			}
			//신규첨부파일이 없는 경우: 기존파일 삭제
			else if(multiReq.getParameter("delFileChk")!=null){
				File delFile = new File(saveDirectory, oldRenamedFileName);
				boolean result = delFile.delete();
				System.out.println("기존첨부파일삭제 "+(result?"성공":"실패"));
				
			}
			//신규첨부파일이 없는 경우: 기존파일 유지
			else {
				noticeOriginalFileName = oldOriginalFileName;
				noticeRenamedFileName = oldRenamedFileName;
			}
			
		}
		
		Notice n = new NoticeService().selectNoticeOne(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeOriginalFileName(noticeOriginalFileName);
		n.setNoticeRenamedFileName(noticeRenamedFileName);
		
		System.out.println("n@noticeUpdateFormEnd="+n);
		
		//2.비즈니스 업무로직
		int result = new NoticeService().updateNotice(n);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/notice/noticeList";
	
		
		if(result>0) {
			msg = "공지사항 수정 성공";
		}
		else {
			msg = "공지사항 수정 실패";
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
