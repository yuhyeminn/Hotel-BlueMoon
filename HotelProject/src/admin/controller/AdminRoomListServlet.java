package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import room.model.vo.Room;

/**
 * Servlet implementation class AdminRoomList
 */
@WebServlet("/views/admin/adminRoomList")
public class AdminRoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService adminService = new AdminService();
		
		//1.파라미터 핸들링
		final int numPerPage = 5;
		int cPage = 1;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));			
		}catch(NumberFormatException e) {
			
		}
		
		//2.업무로직
		//a.컨텐츠영역
		List<Room> list 
			= adminService.selectRoomList(cPage, numPerPage); 
		System.out.println("roomList@servlet="+list);
		
		//b.페이징바영역
		//전체게시글수, 전체페이지수
		int totalContent = adminService.selectRoomCount();
		int totalPage =  (int)Math.ceil((double)totalContent/numPerPage);//(공식2)
		
		String pageBar = "";
		int pageBarSize = 5; 
		int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;//(공식3)
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		//[이전] section
		if(pageNo == 1 ){
			//pageBar += "<span>[이전]</span>"; 
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/views/admin/adminRoomList?cPage="+(pageNo-1)+"'>[이전]</a> ";
		}
			
		// pageNo section
		while(pageNo<=pageEnd && pageNo<=totalPage){
			
			if(cPage == pageNo ){
				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
			} 
			else {
				pageBar += "<a href='"+request.getContextPath()+"/views/admin/adminRoomList?cPage="+pageNo+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){

		} else {
			pageBar += "<a href='"+request.getContextPath()+"/views/admin/adminRoomList?cPage="+pageNo+"'>[다음]</a>";
		}
		
		
		//4.뷰단 포워딩		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/adminRoomList.jsp");
		request.setAttribute("list",list);
		request.setAttribute("pageBar",pageBar);		
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
