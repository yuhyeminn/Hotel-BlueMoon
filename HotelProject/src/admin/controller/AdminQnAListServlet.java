package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import question.model.vo.Question;

/**
 * Servlet implementation class AdminQnAListServlet
 */
@WebServlet("/views/admin/adminQnAList")
public class AdminQnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage = 1;
		final int numPerPage = 5; 
				
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));			
		} catch(NumberFormatException e) {
		}
		System.out.println("cPage@list="+cPage);
				
		int totalContent = new AdminService().selectTotalContent();
		int totalPage = (int)Math.ceil((double)totalContent/numPerPage);
		System.out.printf("totalContent=%s, totalPage=%s%n", totalContent, totalPage);
		
		
		String pageBar = "";
		int pageBarSize = 5;
				
		int pageStart = ((cPage-1)/pageBarSize)*pageBarSize + 1;
		int pageEnd = pageStart+pageBarSize-1;
				
		int pageNo = pageStart;

		if(pageNo != 1) {
			pageBar += "<a href='"+request.getContextPath()+"/views/admin/adminQnAList?cPage="+(pageNo-1)+"'>[이전]</a>\n";
		}
				
		while(pageNo<=pageEnd && pageNo<=totalPage) {
			if(cPage == pageNo) {
				pageBar += "<span class='cPage'>"+pageNo+"</span>\n";
			}
			else {
				pageBar += "<a href='"+request.getContextPath()+"/views/admin/adminQnAList?cPage="+pageNo+"'>"+pageNo+"</a>\n";				
			}
			pageNo++;
		}
				
		if(pageNo <= totalPage) {
			pageBar += "<a href='"+request.getContextPath()+"/views/admin/adminQnAList?cPage="+pageNo+"'>[다음]</a>\n";							
		}
				
		List<Question> list = new AdminService().selectQuestionList(cPage, numPerPage);
		request.setAttribute("list",list);
		request.setAttribute("pageBar", pageBar);
				
		//4.view단처리
		request.getRequestDispatcher("/WEB-INF/views/admin/adminQnAList.jsp")
					 .forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
