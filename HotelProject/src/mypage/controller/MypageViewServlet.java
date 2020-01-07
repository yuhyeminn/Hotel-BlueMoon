package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;
import reservation.model.service.ReservationService;

/**
 * Servlet implementation class MypageViewServlet
 */
@WebServlet("/mypage/main")
public class MypageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		int totalCpnContent = new AdminService().selectTotalCpnContentByMemberId(memberId);
		int totalResvContent = new AdminService().selectTotalResvContentByMemberId(memberId);
		Member m = new MemberService().selectOne(memberId);
		int result = new ReservationService().selectResvCntByMemberId(memberId);
		
		request.setAttribute("m", m);
		request.setAttribute("result", result);
		request.setAttribute("totalCpnContent", totalCpnContent);
		request.setAttribute("totalResvContent", totalResvContent);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypageMain.jsp")
				.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
