package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MypageDeleteEndServlet
 */
@WebServlet("/mypage/deleteEnd")
public class MypageDeleteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		
		Member m = new MemberService().selectOne(memberId);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/";
		
		if(m != null && password.equals(m.getPassword())) {
			int result = new MemberService().deleteMember(memberId);
			if(result > 0) {
					msg = "탈퇴가 완료되었습니다.";
					Member memberLoggedIn = (Member)request.getSession().getAttribute("memberLoggedIn");
					if(!"admin".equals(memberLoggedIn.getMemberId())) {
						loc = "/views/member/logout";
					}
				}
				else {
					msg = "탈퇴에 실패했습니다.";
				}
		}
		else {
			msg = "탈퇴에 실패했습니다.(비밀번호 재확인)";
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
