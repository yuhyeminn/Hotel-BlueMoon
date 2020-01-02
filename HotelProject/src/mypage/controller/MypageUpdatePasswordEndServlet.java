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
 * Servlet implementation class MypageUpdatePasswordEndServlet
 */
@WebServlet(name ="MypageUpdatePasswordEndServlet",
			urlPatterns = "/mypage/updatePasswordEnd")
public class MypageUpdatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String nowPW = request.getParameter("password");
		String newPW = request.getParameter("password_new");
		
		System.out.println(memberId);
		System.out.println(nowPW);
		System.out.println(newPW);

		Member m = new MemberService().selectOne(memberId);
		System.out.println("m@updatePasswordServlet="+m);
		
		String msg = "";
		String loc = "";
		String view = "/WEB-INF/views/common/msg.jsp";
		if(m != null && m.getPassword().equals(nowPW)){
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPassword(newPW);
			
			int result = new MemberService().updatePassword(member);
			if(result>0){
				msg = "패스워드 변경 성공";
			}	
		}
		else {
			msg = "패스워드를 잘못 입력하셨습니다.";
			loc = "/mypage/updatePassword?memberId="+memberId;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		//request.getRequestDispatcher("/WEB-INF/views/mypage/mypageUpdatePassword.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
