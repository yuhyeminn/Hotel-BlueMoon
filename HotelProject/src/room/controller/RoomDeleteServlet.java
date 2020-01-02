package room.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

/**
 * Servlet implementation class RoomDeleteServlet
 */
@WebServlet("/room/roomDelete")
public class RoomDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전송값 꺼내서 변수에 기록하기.
		String roomName = request.getParameter("roomName");
		String renamedFileName = request.getParameter("renamedFileName");

		System.out.println("roomName@servlet="+roomName);
		System.out.println("renamed@servlet="+renamedFileName);
		//2.서비스로직호출
		int result = new AdminService().deleteRoom(roomName);
		
		//파일삭제
		if(result>0 && !"".equals(renamedFileName)) {
			//파일저장경로
			String saveDirectory
				= getServletContext().getRealPath("/upload/adminRoomAdd");
			
			File delFile = new File(saveDirectory, renamedFileName);
			System.out.println("delFile="+delFile);
			
			//1.삭제처리
//					boolean bool = delFile.delete();
			
			//2.이동처리
			String delDirectory 
				= getServletContext().getRealPath("/delete/room");
			File delFileTo = new File(delDirectory, renamedFileName);
			boolean bool = delFile.renameTo(delFileTo);
			
			System.out.println("파일삭제 : "+(bool?"성공!":"실패!"));
		}
		
		//3. 받은 결과에 따라 뷰페이지 내보내기
		if(result>0)
			System.out.println("객실 삭제 성공!");
			
		else 
			System.out.println("게시글 삭제 실패!");	
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/mypage/review");
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
