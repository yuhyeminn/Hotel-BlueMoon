package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberEmailDuplicatedCheckServlet
 */
@WebServlet("/member/memberEmailDuplicatedCheckServlet")
public class MemberEmailDuplicatedCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		System.out.println("email@DuplicatedServlet="+email);
		Member m = new MemberService().selectMemberByEmail(email);
		System.out.println("servletEmailDuplicated@="+m);
		int booleanchk = m==null?0:1;
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		out.print(booleanchk);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
