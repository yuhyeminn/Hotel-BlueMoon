package room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import admin.model.service.AdminService;
import review.model.service.ReviewService;
import review.model.vo.ReviewM;
import room.model.vo.Room;


/**
 * Servlet implementation class RoomReviewSearchServlet
 */
@WebServlet("/room/searchReview")
public class RoomReviewSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService reviewService = new ReviewService();
		
		//1.파라미터 핸들링
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		String rvSrch = request.getParameter("rvSrch");
		
		final int numPerPage = 5;
		int cPage = 1;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));			
		}catch(NumberFormatException e) {
			
		}
		
		//2.업무로직
		//a.컨텐츠영역
		List<ReviewM> srchList = reviewService.selectReviewListByContent(cPage, numPerPage, roomNo, rvSrch); 
		System.out.println("roomList@servlet="+srchList);
		
		//b.페이징바영역
		//전체게시글수, 전체페이지수
		int totalContent = reviewService.selectTotalContentByContent(rvSrch, roomNo);
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
			pageBar += "<a href='"+request.getContextPath()+"/views/room/roomDetail?cPage="+(pageNo-1)+"'>[이전]</a> ";
		}
			
		// pageNo section
		while(pageNo<=pageEnd && pageNo<=totalPage){
			
			if(cPage == pageNo ){
				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
			} 
			else {
				pageBar += "<a href='"+request.getContextPath()+"/views/room/roomDetail?cPage="+pageNo+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){

		} else {
			pageBar += "<a href='"+request.getContextPath()+"/views/room/roomDetail?cPage="+pageNo+"'>[다음]</a>";
		}
		
		
		//4.뷰단 포워딩		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/room/roomDetail.jsp");
		request.setAttribute("srchList", srchList);
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
