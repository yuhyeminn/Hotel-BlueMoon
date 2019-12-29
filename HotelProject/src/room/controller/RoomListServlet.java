package room.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;
import room.model.vo.Room;

/**
 * Servlet implementation class RoomListServlet
 */
@WebServlet("/views/room/roomList")
public class RoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.encoding
		request.setCharacterEncoding("utf-8");
		
		//2.parameter handling
//		String memberId = request.getParameter("memberId");
		
		//3.business logic
		List<Room> list = new AdminService().selectAllRoomList(); 
		System.out.println("AllRoomList@RoomListServlet="+list);
		
		//4.view단
		
		String view = "";
		
		if(list != null) {
			System.out.println("객실 목록이 존재합니다.");
		}
		else {
			System.out.println("객실 목록이 존재하지않습니다.");
		}
		
		request.setAttribute("roomList", list);
		request.getRequestDispatcher("/WEB-INF/views/room/roomList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
