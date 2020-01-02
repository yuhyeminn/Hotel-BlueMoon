package room.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import review.model.service.ReviewService;
import review.model.vo.ReviewM;
import room.model.vo.Room;

/**
 * Servlet implementation class RoomDetailServlet
 */
@WebServlet("/views/room/detail")
public class RoomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파라미터핸들링
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
		//2.업무로직
		Room r = new AdminService().selectOne(roomNo);
		System.out.println("room@RoomDetailServlet="+r);
		
		List<ReviewM> rv = new ReviewService().selectReviewbyRoomNo(roomNo);
		
		
		//3.view단처리:db에서 읽어온 r객체가 null인 경우, msg.jsp를 통해서
		//"해당하는 글은 없습니다." 사용자에게 알려주고, 객실페이지로 이동시킬것
		//게시글 가져오기에 실패한경우
		String view = "";//RequestDispatcher객체에 전달한 view단 주소
		if(r == null){
			request.setAttribute("msg", "객실 상세보기가 존재하지 않습니다.");
			request.setAttribute("loc", "/views/room/roomList");
			view = "/WEB-INF/views/common/msg.jsp";
		}
		else {
			request.setAttribute("room", r);
			request.setAttribute("review", rv);
			view = "/WEB-INF/views/room/roomDetail.jsp";			
		}
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
