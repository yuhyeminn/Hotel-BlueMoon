package reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import room.model.vo.Room;

/**
 * Servlet implementation class ReservationPaymentEndServlet
 */
@WebServlet("/resv/roomPaymentEnd")
public class ReservationPaymentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkindate = request.getParameter("checkindate");
		String checkoutdate = request.getParameter("checkoutdate");
		int room1 = Integer.parseInt(request.getParameter("room1"));
		int room2 = Integer.parseInt(request.getParameter("room2"));
		int roomcnt = Integer.parseInt(request.getParameter("roomcnt"));
		int diffDay = Integer.parseInt(request.getParameter("diffDay"));
		
		String memberId = request.getParameter("resvMemberId");
		int roomNo = Integer.parseInt(request.getParameter("resvRoomNo"));
		
		int breakfastcnt = Integer.parseInt(request.getParameter("breakfastcnt"));
		int usedPoint = Integer.parseInt(request.getParameter("usedPoints"));
		String usedCouponNo = request.getParameter("usedCouponNo");
		int resvTotalPrice = Integer.parseInt(request.getParameter("resvTotalPrice"));
		
		//예약자 멤버 객체
		Member resvMember = new MemberService().selectOne(memberId);
		request.setAttribute("resvMember", resvMember);
		
		//예약한 room 객체
		Room resvRoom = new AdminService().selectOne(roomNo);
		request.setAttribute("resvRoom",resvRoom);
		
		//insert 예약 테이블
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		transFormat.parse(checkindate);

		Reservation resv = new Reservation();
		resv.setResvMemberId(resvMember.getMemberId());
		resv.setResvPeople(room1+room2);
		resv.setResvUsedPoint(usedPoint);
		resv.setResvAddPoint(Integer.parseInt(String.valueOf(Math.round(resvTotalPrice*0.03))));
		resv.setResvDate(transFormat.parse(checkindate));

		
		int resvResult = new ReservationService().insertReservation();
		
		//예약된 방 insert
		
		
		//update 쿠폰 테이블

		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/reservation/resvComplete.jsp");
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
