package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;
import room.model.vo.Room;

/**
 * Servlet implementation class MemerLoginCheckServlet
 */
@WebServlet(name="MemberLoginCheckServlet", 
			urlPatterns="/member/loginCheck")
public class MemerLoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println("memberId="+memberId+" | "+"password="+password);
		
		Member m = new MemberService().selectOne(memberId);
		
		String msg = "";
		String loc = "/";
		RequestDispatcher reqDispatcher 
				= request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		
		if(m == null) {
			msg = "존재하지 않는 아이디입니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			reqDispatcher.forward(request, response);
		}
		else {
			//사용자입력비번과 db회원정보비번 비교
			//비번이 틀린 경우 =>  로그인 실패
			if(!m.getPassword().equals(password)) {
				msg = "비밀번호가 틀렸습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				reqDispatcher.forward(request, response);
			}
			//아이디/비번이 모두 일치한 경우 => 로그인 성공
			else {
				HttpSession session = request.getSession(true);
				System.out.println("SESSIONID="+session.getId());
				session.setAttribute("memberLoggedIn", m);
				response.sendRedirect(request.getContextPath());
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
