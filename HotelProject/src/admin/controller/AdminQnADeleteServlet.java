package admin.controller;

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
 * Servlet implementation class AdminQnADeleteServlet
 */
@WebServlet("/admin/qnaDelete")
public class AdminQnADeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String renamedFileName = request.getParameter("renamedFileName");
		System.out.println("qnaNo@servlet="+qnaNo);
		System.out.println("renamedFileName@servlet="+renamedFileName);
		
		int result = new AdminService().deleteQuestion(qnaNo);
		
		//파일삭제
		if(result>0 && !"".equals(renamedFileName)) {
			//파일저장경로
			String saveDirectory
				= getServletContext().getRealPath("/upload/question");
					
			File delFile = new File(saveDirectory, renamedFileName);
			System.out.println("delFile="+delFile);
					
			//1.삭제처리
//			boolean bool = delFile.delete();
					
			//2.이동처리
			String delDirectory 
				= getServletContext().getRealPath("/delete/question");
			File delFileTo = new File(delDirectory, renamedFileName);
			boolean bool = delFile.renameTo(delFileTo);
					
			System.out.println("파일삭제 : "+(bool?"성공!":"실패!"));
		}
				
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/views/admin/adminQnAList";

		if(result>0)
			msg = "문의사항 삭제 성공!";
					
		else 
			msg = "문의사항 삭제 실패!";	
				
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
