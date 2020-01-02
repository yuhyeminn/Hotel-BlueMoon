package reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.BookedRoom;
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
		Reservation resv = new Reservation(0,resvMember.getMemberId(),room1+room2,usedPoint,Integer.parseInt(String.valueOf(Math.round(resvTotalPrice*0.03))),null,resvTotalPrice,null,Date.valueOf(checkindate),Date.valueOf(checkoutdate),breakfastcnt);

		int resvResult = new ReservationService().insertReservation(resv);
		
		//예약된 방 insert
		BookedRoom bookedroom1 = new BookedRoom(0,resvRoom.getRoomNo(),resv.getResvNo(),room1,Date.valueOf(checkindate),Date.valueOf(checkoutdate),diffDay*resvRoom.getRoomPrice(),0);
		int room1Result = new ReservationService().insertBookedRoom(bookedroom1);
		if(room2!=0) {
			BookedRoom bookedroom2 = new BookedRoom(0,resvRoom.getRoomNo(),resv.getResvNo(),room2,Date.valueOf(checkindate),Date.valueOf(checkoutdate),diffDay*resvRoom.getRoomPrice(),0);
			int room2Result = new ReservationService().insertBookedRoom(bookedroom2);
		}
		
		//update 쿠폰 테이블
		if(usedCouponNo!="") {
			int couponResult = new ReservationService().updateCouponStatus(usedCouponNo);
		}
		System.out.println("usedCoupon="+usedCouponNo);
		
		 Map<Object, Object> map = new HashMap<>();
			map.put("checkindate",checkindate);
			map.put("checkoutdate",checkoutdate);
			map.put("room1",room1);
			if(room2!=0) map.put("room2", room2);
			map.put("roomcnt", roomcnt);
			map.put("diffDay", diffDay);
			map.put("resvTotalPrice", resvTotalPrice);
			map.put("breakfastcnt", breakfastcnt);
			
		String msg = "";
	    String loc = "/";
	    String view = "/WEB-INF/views/reservation/resvComplete.jsp";
	      
	      if(resvResult>0) {
	    	  request.setAttribute("infomap", map);
	      }
	      else {
	    	  request.setAttribute("msg", msg);
		      request.setAttribute("loc", loc);
	         msg = "예약 실패. 관리자에게 문의하세요.";
	         view="/WEB-INF/views/common/msg.jsp";
	      }
	      //3.view단 처리 
	     
	      request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
