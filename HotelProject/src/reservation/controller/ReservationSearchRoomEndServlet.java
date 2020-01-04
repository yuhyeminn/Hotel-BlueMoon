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

import reservation.model.service.ReservationService;
import room.model.vo.Room;

/**
 * Servlet implementation class ResvRoomSearchEndServlet
 */
@WebServlet("/resv/roomSearchEnd")
public class ReservationSearchRoomEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkindate = request.getParameter("checkin-date");
		String checkoutdate = request.getParameter("checkout-date");
		String room1 = request.getParameter("room1-cnt");
		String room2 = request.getParameter("room2-cnt");
		
		int roomcnt = 1;
		
		if(room2!=null) roomcnt = 2;
		
		//예약 가능한 객실 목록 가져오기
		List<Room> roomlist = new ReservationService().selectAvailableRoomList(checkindate,checkoutdate,roomcnt);
		System.out.println("availableroomlist@servlet="+roomlist);
		
		Map<Object, Object> map = new HashMap<>();
		map.put("roomlist",roomlist);
		map.put("checkindate",checkindate);
		map.put("checkoutdate",checkoutdate);
		map.put("room1",room1);
		if(room2!=null) map.put("room2", room2);
		map.put("roomcnt", roomcnt);
		
		
		//뷰단 포워딩
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/reservation/resvRoomPriceSelect.jsp");
		request.setAttribute("infomap", map);
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
