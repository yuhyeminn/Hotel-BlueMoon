package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import coupon.model.vo.CouponKind;

/**
 * Servlet implementation class AdminCreateCoupon
 */
@WebServlet("/admin/createCoupon")
public class AdminCreateCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.Encoding
		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("coupon-content");
		int discnt = Integer.parseInt(request.getParameter("coupon-discnt"));
		int min = Integer.parseInt(request.getParameter("coupon-min-value"));
		System.out.println("min="+min);
		
		CouponKind ck = new CouponKind(0,content,discnt,min);
		
		//3.서비스로직호출
		int result = new AdminService().createCoupon(ck);
		
		//4. 받은 결과에 따라 뷰페이지 내보내기
		if(result>0)
			System.out.println("성공적으로 쿠폰을 생성했습니다.");
		else 
			System.out.println("쿠폰 생성에 실패했습니다."); 	
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/views/admin/adminCouponKindList");
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
