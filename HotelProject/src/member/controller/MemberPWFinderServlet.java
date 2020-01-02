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
 * Servlet implementation class MemberPWFinderServlet
 */
@WebServlet("/member/pwdFinder")
public class MemberPWFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println("pwdFinder@servlet="+id+","+name+","+email);
		
		Member m = new Member();
		m.setMemberId(id);
		m.setMemberName(name);
		m.setEmail(email);
		
		Member member = new MemberService().selectMemberPW(m);
		
		String msg = "";
		String loc = "";

		if(member == null) {
			msg = "입력하신 회원정보는 존재하지 않습니다.";
			loc = "/views/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
		else {
			msg = member.getMemberId()+"님, 비밀번호를 변경해드리겠습니다.";
			loc = "/member/finderUpdatePW";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.setAttribute("member", member);
			request.getRequestDispatcher("/WEB-INF/views/member/loginfinderModal.jsp").forward(request, response);
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
