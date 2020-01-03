package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

/**
 * Servlet implementation class AdminResvDeleteServlet
 */
@WebServlet("/views/admin/adminResvDelete")
public class AdminResvDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값 꺼내서 변수에 기록하기.
		long resvNo = Long.parseLong(request.getParameter("resvNo"));

		//2.서비스로직호출
		long result = new AdminService().deleteReservation(resvNo);
		
		
		//3. 받은 결과에 따라 뷰페이지 내보내기
		if(result>0)
			System.out.println("예약 삭제 성공!");
			
		else 
			System.out.println("예약 삭제 실패!");	
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/views/admin/adminReservationList");
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
