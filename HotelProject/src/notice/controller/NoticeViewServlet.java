package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/notice/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//1.파라미터핸들링
				int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
				
				//게시글 상세보기 관련 쿠키처리
				Cookie[] cookies = request.getCookies();
				String noticeCookieVal = "";//이미 존재하는 value
				boolean hasRead = false;
				
				//사이트 첫방문시, 아무런 쿠키가 없다. jsessionid값도 없다. 
				if(cookies != null) {
					for(Cookie c : cookies) {
						String name = c.getName();
						String value = c.getValue();
						if("noticeCookie".equals(name)) {
							noticeCookieVal = value;
							if(value.contains("|"+noticeNo+"|")) {
								hasRead = true;
							}
						}
					}
				}
				
				//이 게시글을 읽은 적이 없다면, 쿠키 재생성
				if(!hasRead) {
					//session cookie : 
					//	setMaxAge를 설정하지 않은 경우. 클라이언트 닫는 경우 소멸.
					//	setMaxAge(-1)과 동일. 기본값.
					//persistent cookie :
					// 	setMaxAge를 설정한 경우, 지정한 시각까지 영속함.
					Cookie noticeCookie = new Cookie("noticeCookie", noticeCookieVal+"|"+noticeNo+"|");
					noticeCookie.setPath(request.getContextPath()+"/notice");
					noticeCookie.setMaxAge(365*24*60*60);//영속쿠키 작성
					response.addCookie(noticeCookie);
				}
				
				//2.업무로직
				Notice notice = new NoticeService().selectNoticeOne(noticeNo, hasRead);
				
				//3.view단처리:db에서 읽어온 Board객체가 null인 경우, msg.jsp를 통해서
				//"해당하는 글은 없습니다." 사용자에게 알려주고, 목록페이지로 이동시킬것
				//게시글 가져오기에 실패한경우
				String view = "";//RequestDispatcher객체에 전달한 view단 주소
				if(notice == null){
					request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
					request.setAttribute("loc", "/notice/noticeList");
					view = "/WEB-INF/views/common/msg.jsp";
				}
				else {
					request.setAttribute("notice", notice);
					view = "/WEB-INF/views/notice/noticeView.jsp";			
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
