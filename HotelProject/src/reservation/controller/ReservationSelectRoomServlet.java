package reservation.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.dao.MemberDAO;
import member.model.service.MemberService;
import member.model.vo.Member;
import room.model.vo.Room;

/**
 * Servlet implementation class ReservationPayment
 */
@WebServlet("/views/reservation/selectRoomEnd")
public class ReservationSelectRoomServlet extends HttpServlet {
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
		
//		System.out.println(checkindate +","+checkoutdate +","+room1+","+room2+","+roomcnt+","+room_no);
		
		Room selectedroom = new AdminService().selectOne(room_no);
		request.setAttribute("selectedroom", selectedroom);
		
		Member resvMember = new MemberService().selectOne(memberId);
		request.setAttribute("resvMember", resvMember);
		
		Map<Object, Object> map = new HashMap<>();
		map.put("checkindate",checkindate);
		map.put("checkoutdate",checkoutdate);
		map.put("room1",room1);
		if(room2!=0) map.put("room2", room2);
		map.put("roomcnt", roomcnt);
		map.put("diffDay", diffDay);

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
