package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberReviewEndServlet
 */
@WebServlet("/mypage/reviewEnd")
public class MemberReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewContext = request.getParameter("review-context");
		String starClean = request.getParameter("input-1");
		String starComm = request.getParameter("input-2");
		String starCheckIn = request.getParameter("input-3");
		String starLocation = request.getParameter("input-4");
		String starValue = request.getParameter("input-5");
		String memberId = request.getParameter("memberId");
		
		System.out.println("reviewContext@ReviewEndServlet="+reviewContext);
		System.out.println("star1@ReviewEndServlet="+starClean);
		System.out.println("star2@ReviewEndServlet="+starComm);
		System.out.println("star3@ReviewEndServlet="+starCheckIn);
		System.out.println("star4@ReviewEndServlet="+starLocation);
		System.out.println("star5@ReviewEndServlet="+starValue);
		System.out.println("memberId@ReviewEndServlet="+memberId);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
