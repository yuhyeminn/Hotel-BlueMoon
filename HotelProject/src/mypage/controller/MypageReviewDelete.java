package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class MypageReviewDelete
 */
@WebServlet("/mypage/reviewDelete")
public class MypageReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReviewDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNoforDelete"));
		String memberId = request.getParameter("memberId");
		
		int result = new MemberService().deleteReview(reviewNo);
		
		if(result>0)
			System.out.println("리뷰 삭제 성공!");
			
		else 
			System.out.println("리뷰 삭제 실패!");	
		
		request.setAttribute("memberId", memberId);
		request.getRequestDispatcher("/mypage/review").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
