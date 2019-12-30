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
 * Servlet implementation class AdminQnAFinderServlet
 */
@WebServlet("/admin/qnaFinder")
public class AdminQnAFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int cPage = 1;
			final int numPerPage = 5;
				
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));			
			}catch(NumberFormatException e) {
					
			}
				
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");
			System.out.println("searchType@finder="+searchType);
			System.out.println("searchKeyword@finder="+searchKeyword);
				
			//2.업무로직
			List<Question> list = null;
			AdminService adminService = new AdminService();
				
			switch(searchType) {
			case "memberId": list = adminService.selectQuestionByMemberId(searchKeyword, cPage, numPerPage); break;
			case "category": list = adminService.selectQuestionByMemberName(searchKeyword, cPage, numPerPage); break;
			case "answer": list = adminService.selectQuestionByGender(searchKeyword, cPage, numPerPage); break;
			}

			int totalContent = 0;
			switch (searchType) {
			case "memberId"	:totalContent = new AdminService().selectTotalContentByMemberId(searchKeyword);break;
			case "category" :totalContent = new AdminService().selectTotalContentByQuestionName(searchKeyword);break;
			case "answer"	:totalContent = new AdminService().selectTotalContentByAnswer(searchKeyword);break;
			}

			int totalPage = (int)Math.ceil((double)totalContent/numPerPage);
			System.out.println("totalMember="+totalContent+", totalPage="+totalPage);
				
			String pageBar = "";	
			int pageBarSize = 5;
			int pageStart = ((cPage - 1)/pageBarSize) * pageBarSize +1;
			int pageEnd = pageStart+pageBarSize-1;
			System.out.println("pageStart["+pageStart+"] ~ pageEnd["+pageEnd+"]");
			int pageNo = pageStart;		

			if(pageNo == 1 ){

			}
			else {
				pageBar += "<a href='"+request.getContextPath()+"/admin/qnaFinder?searchType="+searchType+"&searchKeyword="+searchKeyword+"&cPage="+(pageNo-pageBarSize)+"'>[이전]</a> ";
			}

			while(pageNo<=pageEnd && pageNo<=totalPage){
				if(cPage ==  pageNo ){
					pageBar += "<span class='cPage'>"+pageNo+"</span> ";
				} 
				else {
					pageBar += "<a href='"+request.getContextPath()+"/admin/qnaFinder?searchType="+searchType+"&searchKeyword="+searchKeyword+"&cPage="+pageNo+"'>"+pageNo+"</a> ";
				}
				pageNo++;
			}
				
			if(pageNo > totalPage){
					
			} else {
					
				pageBar += "<a href='"+request.getContextPath()+"/admin/qnaFinder?searchType="+searchType+"&searchKeyword="+searchKeyword+"&cPage="+pageNo+"'>[다음]</a>";
			}
				
			System.out.println("list@finder="+list);
			System.out.println("pageBar@finder="+pageBar);
				
			request.setAttribute("list", list);
			request.setAttribute("pageBar",pageBar);
			request.setAttribute("cPage",cPage);
				
			request.getRequestDispatcher("/WEB-INF/views/admin/adminQnAFinder.jsp")
					   .forward(request, response);
			
			}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
