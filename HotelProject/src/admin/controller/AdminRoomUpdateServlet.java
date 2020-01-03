package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import admin.model.service.AdminService;
import common.MvcFileRenamePolicy;
import room.model.vo.Room;

/**
 * Servlet implementation class AdminRoomAddServlet
 */
@WebServlet("/admin/adminRoomUpdate")
public class AdminRoomUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRoomUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
				
		//1.parameter handling
		String roomName = request.getParameter("update-room-name");
		String roomDescribe = request.getParameter("update-room-describe");
		String roomDescribe2 = request.getParameter("update-room-describe2");
		String roomView = request.getParameter("update-room-view");
		int roomPeople = Integer.parseInt(request.getParameter("update-room-people"));
		String roomBedType = request.getParameter("update-room-bedType");
		int roomPrice = Integer.parseInt(request.getParameter("update-room-price"));
		int roomNum = Integer.parseInt(request.getParameter("update-room-num"));
		int roomSize = Integer.parseInt(request.getParameter("update-room-size"));
		int roomNo = Integer.parseInt(request.getParameter("update-room-no"));
		
				
		
		Room r = new Room(roomNo, roomName, roomDescribe, roomDescribe2, roomPeople, roomBedType, roomView, roomPrice, 35000, roomNum, roomSize, null, null);
		System.out.println("room@roomUpdateServlet="+r);
		
		//2.business logic
		int result = new AdminService().updateRoomByRoomNo(r);
		
		
		if(result>0) {
			System.out.println("객실 수정 성공!");
		}
		else {
			System.out.println("객실 수정 실패! 관리자에게 문의하세요.");
		}
		
		
		//3.view단 처리
		request.getRequestDispatcher("/views/admin/adminRoomList")
			   .forward(request, response);
				
			
}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
