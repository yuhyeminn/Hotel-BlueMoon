package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/notice/noticeDelete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
//		String noticeAvailable = request.getParameter("noticeAvailable");
		
		Notice n = new NoticeService().selectNoticeOne(noticeNo);
		n.setNoticeNo(noticeNo);
//		n.setNoticeAvailable(noticeAvailable);
		
		System.out.println("n@noticeDeleteServlet="+n);
		
		//2.업무로직
		int result = new NoticeService().deleteNotice(n);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/notice/noticeList";
		
		if(result>0) {
			msg = "공지사항 삭제 성공";
		}
		else {
			msg = "공지사항 삭제 실패";
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
