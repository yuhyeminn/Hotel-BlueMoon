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
 * Servlet implementation class MemberFinderUpdatePWEndServlet
 */
@WebServlet(name="MemberFinderUpdatePWEndServlet",
			urlPatterns = "/member/finderUpdatePWEnd")
public class MemberFinderUpdatePWEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String newPW = request.getParameter("password_new");
		String newPWChk = request.getParameter("password_newChk");
		System.out.println("finderUpdatePW@servlet="+memberId+","+newPW+","+newPWChk);
		
		
		Member m = new MemberService().selectOne(memberId);
		System.out.println("m@findeUupdatePasswordServlet="+m);
		
		String msg = "";
		String loc = "";
		String view = "/WEB-INF/views/common/msg.jsp";
		
		if(m != null){
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPassword(newPW);
			
			int result = new MemberService().updatePassword(member);
			if(result>0){
				msg = "패스워드 변경 성공";
				loc = "/views/member/login";
			}	
		}
		else {
			msg = "패스워드를 잘못 입력하셨습니다.";
			loc = "/member/finderUpdatePW";
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
