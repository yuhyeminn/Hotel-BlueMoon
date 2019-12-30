
package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import question.model.vo.Comment;

/**
 * Servlet implementation class AdminCommentInsertServlet
 */
@WebServlet("/admin/insertComment")
public class AdminCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaRef = Integer.parseInt(request.getParameter("qnaRef"));
		String qnaCommentContent = request.getParameter("qnaCommentContent");
		System.out.println("qnaRef@servlet="+qnaRef);
		System.out.println("qnaCommentContent@servlet="+qnaCommentContent);
		
		Comment c = new Comment();
		c.setQuestionRef(qnaRef);
		c.setCommentContent(qnaCommentContent);
		
		
		int insertResult = new AdminService().insertComment(c);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/admin/questionView?question_no="+qnaRef;
		
		if(insertResult > 0) {
			int updateResult = new AdminService().updateCommnet(c);
				if(updateResult>0) {
					msg = "댓글등록 성공!";
				}
				else {
					msg = "댓글등록 실패!";	
				}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
				
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
