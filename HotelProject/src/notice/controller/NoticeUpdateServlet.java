	package notice.controller;
	
	import java.io.IOException;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import notice.model.service.NoticeService;
	import notice.model.vo.Notice;
	
	/**
	 * Servlet implementation class NoticeUpdateServlet
	 */
	@WebServlet("/notice/noticeUpdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		Notice n = new NoticeService().selectNoticeOne(noticeNo);
		
		String view = "";//RequestDispatcher객체에 전달한 view단 주소
		if(n == null){
			request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
			request.setAttribute("loc", "/notice/noticeList");
			view = "/WEB-INF/views/common/msg.jsp";
		}
		else {
			request.setAttribute("notice", n);
			view = "/WEB-INF/views/notice/noticeUpdateForm.jsp";			
		}
		request.getRequestDispatcher(view)
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
