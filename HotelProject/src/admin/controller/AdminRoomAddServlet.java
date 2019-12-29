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
@WebServlet("/admin/adminRoomAdd")
public class AdminRoomAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRoomAddServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일이 저장될 절대경로 가져오기
		String saveDirectory
			= getServletContext().getRealPath("/upload/adminRoomAdd");// / 웹루트 WebContent
		System.out.println("saveDirectory="+saveDirectory);
		
		//파일최대업로드크기 제한: 10MB까지 제한
		//10MB = 1024 * 1024 * 10
		int maxPostSize = 1024 * 1024 * 10; 
		
		//파일명 재지정 정책 객체
		FileRenamePolicy mvcFileRenamePolicy
			= new MvcFileRenamePolicy();
		MultipartRequest multiReq = new MultipartRequest(request,
														 saveDirectory, 
														 maxPostSize, 
														 "utf-8",
														 mvcFileRenamePolicy);
		
		
		
		//1.parameter handling
		String roomName = multiReq.getParameter("room-name");
		String roomDescribe = multiReq.getParameter("room-describe");
		String roomDescribe2 = multiReq.getParameter("room-describe2");
		String roomView = multiReq.getParameter("room-view");
		int roomPeople = Integer.parseInt(multiReq.getParameter("room-people"));
		String roomBedType = multiReq.getParameter("room-bedType");
		int roomPrice = Integer.parseInt(multiReq.getParameter("room-price"));
		int roomNum = Integer.parseInt(multiReq.getParameter("room-num"));
		int roomSize = Integer.parseInt(multiReq.getParameter("room-size"));
		
				
		String originalFileName 
			= multiReq.getOriginalFileName("upFile");//사용자 업로드한 파일명
		String renamedFileName
			= multiReq.getFilesystemName("upFile");//실제 저장된 파일명
		
		Room r = new Room(0, roomName, roomDescribe, roomDescribe2, roomPeople, roomBedType, roomView, roomPrice, 35000, roomNum, roomSize, originalFileName, renamedFileName);
		System.out.println("room@roomAddServlet="+r);
		
		//2.business logic
		int result = new AdminService().insertRoom(r);
		
		
		if(result>0) {
			System.out.println("객실 등록 성공!");
		}
		else {
			System.out.println("객실 등록 실패! 관리자에게 문의하세요.");
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
