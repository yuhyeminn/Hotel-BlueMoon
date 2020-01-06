package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginCheckServlet
 */
@WebServlet("/views/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		String referer = request.getHeader("Referer");
		request.setAttribute("refererPage", referer);
		String view = "/WEB-INF/views/member/login.jsp";
		
		if(memberLoggedIn != null) {
			String msg = "이미 로그인 하셨습니다.";
			String loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			view = "/WEB-INF/views/common/msg.jsp";
		}
		
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
