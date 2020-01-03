package reservation.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import coupon.model.vo.Coupon;
import member.model.service.MemberService;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import room.model.vo.Room;

/**
 * Servlet implementation class ReservationPayment
 */
@WebServlet("/views/reservation/selectRoomEnd")
public class ReservationSelectRoomEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String checkindate = request.getParameter("checkindate");
		String checkoutdate = request.getParameter("checkoutdate");
		int room1 = Integer.parseInt(request.getParameter("room1"));
		int room2 = request.getParameter("room2")!=null?Integer.parseInt(request.getParameter("room2")):0;
		int roomcnt = Integer.parseInt(request.getParameter("roomCnt"));
		int room_no = Integer.parseInt(request.getParameter("roomNo"));
		int diffDay = Integer.parseInt(request.getParameter("diffDay"));
		
		//선택한 객실 정보
		Room selectedroom = new AdminService().selectOne(room_no);
		request.setAttribute("selectedroom", selectedroom);
		
		//예약자 정보
		Member resvMember = new MemberService().selectOne(memberId);
		request.setAttribute("resvMember", resvMember);
		
		int totalRoomPrice = roomcnt * selectedroom.getRoomPrice() * diffDay;
		//예약자의 보유 쿠폰 리스트
		Map<String, Object> couponMap = new ReservationService().selectCouponListByMemberId(resvMember.getMemberId(),totalRoomPrice);
		request.setAttribute("couponMap", couponMap);
		System.out.println("couponMap@selectRoomEnd="+couponMap);
		
		Map<Object, Object> map = new HashMap<>();
		map.put("checkindate",checkindate);
		map.put("checkoutdate",checkoutdate);
		map.put("room1",room1);
		if(room2!=0) map.put("room2", room2);
		map.put("roomcnt", roomcnt);
		map.put("diffDay", diffDay);
		map.put("totalRoomPrice", totalRoomPrice);
		
		//뷰단 포워딩
		request.setAttribute("infomap", map);
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/reservation/resvPayment.jsp");
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
