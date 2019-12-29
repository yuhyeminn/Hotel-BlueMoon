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
 * Servlet implementation class MemberIdDuplicatedCheckServlet
 */
@WebServlet("/member/memberIdDuplicatedCheckServlet")
public class MemberIdDuplicatedCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdDuplicatedCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청 인코딩처리
		request.setCharacterEncoding("utf-8");
		
		//2.파라미터값  가져오기
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		//3.비지니스로직처리 : 해당하는 User찾기
		Member m = new MemberService().selectOne(memberId);
		System.out.println("servlet@="+m);
		int booleanchk = m==null?0:1;
		
		
		//4.응답객체에 출력
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		out.print(booleanchk);		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
