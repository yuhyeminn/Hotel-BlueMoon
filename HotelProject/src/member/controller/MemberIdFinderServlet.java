package member.controller;

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
 * Servlet implementation class MemberIdFinderServlet
 */
@WebServlet("/member/idFinder")
public class MemberIdFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println("name@servlet="+name);
		System.out.println("email@servlet="+email);
		
		Member m = new Member();
		m.setMemberName(name);
		m.setEmail(email);
		
		Member member = new MemberService().selectMemberId(m);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/views/member/login";

		if(member == null) {
			msg = "입력하신 회원정보는 존재하지 않습니다.";
		}
		else {
			msg = "회원님의 아이디는 "+member.getMemberId()+"입니다.";
		}
				
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
				
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
