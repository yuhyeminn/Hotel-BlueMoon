package question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class QuestionMainViewServlet
 */
@WebServlet("/mypage/questionList")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		
		int cPage = 1;
		final int numPerPage = 5; 
				
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));			
		} catch(NumberFormatException e) {
		}
				
		int totalContent = new QuestionService().selectTotalContentByMemberId(memberId);
		int totalPage = (int)Math.ceil((double)totalContent/numPerPage);
		
		String pageBar = "";
		int pageBarSize = 5;
				
		int pageStart = ((cPage-1)/pageBarSize)*pageBarSize + 1;
		int pageEnd = pageStart+pageBarSize-1;
				
		int pageNo = pageStart;

		if(pageNo != 1) {
			pageBar += "<a href='"+request.getContextPath()+"/mypage/questionList?cPage="+(pageNo-1)+"&memberId="+memberId+"'>[이전]</a>\n";
		}
				
		while(pageNo<=pageEnd && pageNo<=totalPage) {
			if(cPage == pageNo) {
				pageBar += "<span class='cPage'>"+pageNo+"</span>\n";
			}
			else {
				pageBar += "<a href='"+request.getContextPath()+"/mypage/questionList?cPage="+pageNo+"&memberId="+memberId+"'>"+pageNo+"</a>\n";				
			}
			pageNo++;
		}
				
		if(pageNo <= totalPage) {
			pageBar += "<a href='"+request.getContextPath()+"/mypage/questionList?cPage="+pageNo+"&memberId="+memberId+"'>[다음]</a>\n";							
		}
				
		List<Question> list = new QuestionService().selectQuestionByMemberId(memberId, cPage, numPerPage);
		request.setAttribute("list",list);
		request.setAttribute("pageBar", pageBar);
				
		//4.view단처리
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypageQuestionView.jsp")
				.forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*String memberId = request.getParameter("memberId");
		//System.out.println("memberId@servletQ&A="+memberId);

		List<Question> qnaList = new QuestionService().selectQuestion(memberId);
		
		request.setAttribute("qnaList", qnaList);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypageQuestionView.jsp").forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
