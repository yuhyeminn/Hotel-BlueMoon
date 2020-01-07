package mypage.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.NumberFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dao.MemberDAO;
import member.model.service.MemberService;
import review.model.vo.Review;

/**
 * Servlet implementation class MemberReviewEndServlet
 */
@WebServlet("/mypage/reviewEnd")
public class MypageReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReviewEndServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		long resvNo = Long.parseLong(request.getParameter("clickedResvNo"));
		String memberId = request.getParameter("memberId");
		int roomNo = Integer.parseInt(request.getParameter("clickedRoomNo"));
		String reviewContext = request.getParameter("review-context");
		int starClean = Integer.parseInt(request.getParameter("input-1"));
		int starComm = Integer.parseInt(request.getParameter("input-2"));
		int starCheckIn = Integer.parseInt(request.getParameter("input-3"));
		int starLocation = Integer.parseInt(request.getParameter("input-4"));
		int starValue = Integer.parseInt(request.getParameter("input-5"));
		
		Review review = new Review(0, memberId, resvNo, roomNo, reviewContext, null,
				starClean, starComm, starCheckIn, starLocation, starValue);

		int result = new MemberService().insertReview(review);
		
		//받은 결과에 따라 뷰페이지 내보내기
		if(result>0)
			System.out.println("리뷰 작성 성공!");
		else 
			System.out.println("리뷰 작성 실패!"); 	
		
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
