package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import review.model.vo.ReviewN;
import review.model.vo.ReviewNN;

/**
 * Servlet implementation class MypageReviewServlet
 */
@WebServlet("/mypage/review")
public class MypageReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.encoding
		request.setCharacterEncoding("utf-8");	
		
		String memberId = request.getParameter("memberId");
		System.out.println("memberId@mypageReviewServlet="+memberId);
		
		//리뷰가 작성되지 않은 예약리스트(ReviewN)
		List<ReviewN> reviewNullList = new MemberService().selectReviewN(memberId);
		System.out.println("reviewNullList@mypageReviewServlet"+reviewNullList);
		
		//리뷰가 작성되지 않은 예약리스트(ReviewNN)
		List<ReviewNN> reviewNotNullList = new MemberService().selectReviewNN(memberId);
		System.out.println("reviewNotNullList@mypageReviewServlet"+reviewNotNullList);
		
		
		request.setAttribute("rvnl", reviewNullList);
		request.setAttribute("rvnnl", reviewNotNullList);
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypageReview.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
