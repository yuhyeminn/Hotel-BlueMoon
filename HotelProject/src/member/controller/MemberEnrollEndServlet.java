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
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet(name="MemberEnrollEndServlet", 
			urlPatterns="/member/enrollmember3")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.encoding
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String memberName = request.getParameter("memberName");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Member member = new Member(memberId, password, memberName, birth, email, phone, 0, null);

//		System.out.println("member@MemberEnrollEndServlet="+member);
		
		//3.서비스로직호출
		int result = new MemberService().insertMember(member);
		
		//4. 받은 결과에 따라 뷰페이지 내보내기
		if(result>0)
			System.out.println("성공적으로 회원등록했습니다.");
		else 
			System.out.println("회원등록에 실패했습니다."); 	
		
		request.setAttribute("member", member);
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/member/enrollmember3.jsp");
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
