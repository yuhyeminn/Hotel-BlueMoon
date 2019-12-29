package reservation.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class ResvRoomSearchEndServlet extends HttpServlet {
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
		
		System.out.println("checkindate="+checkindate);
		System.out.println("checkoutdate="+checkoutdate);
		System.out.println("room1-cnt="+room1);
		System.out.println("room2-cnt="+room2); //없을 경우 null로 반환됨
		
		Map<String,String> informMap = new HashMap<>();
		informMap.put("checkindate", checkindate);
		informMap.put("checkoutdate", checkoutdate);
		if(room2!=null) {
			roomcnt = 2;
			informMap.put("roomcnt", Integer.toString(roomcnt));
		}
		
		//예약 가능한 객실 목록 가져오기
		List<Room> roomlist = new ReservationService().selectAvailableRoomList(informMap);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
