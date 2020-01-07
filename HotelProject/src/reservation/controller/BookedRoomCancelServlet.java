package reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.BookedRoomService;

/**
 * Servlet implementation class BookedRoomCancelServlet
 */
@WebServlet("/mypage/cancelReserv")
public class BookedRoomCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  long resvNo = Long.parseLong(request.getParameter("resvNo"));
//	      System.out.println("BookedRoomCancelServlet@bookedNo="+bookedNo);
	      String memberId = request.getParameter("memberId");
//	      System.out.println("BookedRoomCancelServlet@memberId="+memberId);
	      
	      int result = new BookedRoomService().cancelBookedRoom(resvNo);

	      String view = "/WEB-INF/views/common/msg.jsp";
	      String msg = "";
	      String loc = "/";
	      
	      if(result>0) {
	         msg="예약이 정상적으로 취소되었습니다.";
	         loc = "/mypage/myReservationList?memberId="+memberId;
	      }else {
	         msg="예약취소가 되지 않았습니다.";
	         loc = "/mypage/myReservationList?memberId="+memberId;
	      }
	      
	      request.setAttribute("msg", msg);
	      request.setAttribute("loc", loc);
	      
	      RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
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
