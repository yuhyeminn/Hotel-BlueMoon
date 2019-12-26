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
 * Servlet implementation class MypageUpdateEndServlet
 */
@WebServlet("/mypage/updateEnd")
public class MypageUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("id");
		String memberName = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		System.out.println(phone+"|"+email);
		
		Member m = new Member(memberId, null, memberName, null, null, email, phone, 0, null);
		int result = new MemberService().updateMember(m);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/mypage/update?memberId="+memberId;

		if(result>0){
			msg = "성공적으로 회원정보를 수정했습니다.";
			Member memberLoggedIn = (Member)request.getSession().getAttribute("memberLoggedIn");
			
			//관리자일때는 세션에 로그인 객체 변경 하지 않기위한 조건문 
			if(!"admin".equals(memberLoggedIn.getMemberId())) {
				//현재 session에 저장된 memberLoggedIn객체 반영
				request.getSession().setAttribute("memberLoggedIn", m);
			}
		}
		else 
			msg = "회원정보수정에 실패했습니다.";	
				
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
