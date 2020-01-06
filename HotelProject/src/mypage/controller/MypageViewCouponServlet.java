package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import coupon.model.vo.Coupon;
import coupon.model.vo.CouponKind;

/**
 * Servlet implementation class MypageViewCouponServlet
 */
@WebServlet("/mypage/myCoupon")
public class MypageViewCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자입력값 처리
				int cPage = 1;//초기값 설정
				final int numPerPage = 10; 
				String memberId = request.getParameter("memberId");
//				System.out.println("memberId="+memberId);
				
				try {
					cPage = Integer.parseInt(request.getParameter("cPage"));			
				} catch(NumberFormatException e) {
					//cPage입력값이 없거나, 부정입력한 경우 기본값으로 처리된다.
				}
//				System.out.println("cPage@list="+cPage);
				
				//페이징바영역처리
				int totalContent = new AdminService().selectTotalCpnContentByMemberId(memberId);
				int totalPage = (int)Math.ceil((double)totalContent/numPerPage);//(공식2)
//				System.out.printf("totalContent=%s, totalPage=%s%n", totalContent, totalPage);
				
				String pageBar = "";
				int pageBarSize = 5;
				
				int pageStart = ((cPage-1)/pageBarSize)*pageBarSize + 1;
				int pageEnd = pageStart+pageBarSize-1;
				
				//증감변수 pageNo
				int pageNo = pageStart;
				
				//1.이전
				if(pageNo != 1) {
					pageBar += "<a href='"+request.getContextPath()+"/views/mypage/mypageCoupon?cPage="+(pageNo-1)+"'>[이전]</a>\n";
				}
				
				//2.pageNo
				while(pageNo<=pageEnd && pageNo<=totalPage) {
					//현재페이지인 경우
					if(cPage == pageNo) {
						pageBar += "<span class='cPage'>"+pageNo+"</span>\n";
					}
					else {
						pageBar += "<a href='"+request.getContextPath()+"/views/mypage/mypageCoupon?cPage="+pageNo+"'>"+pageNo+"</a>\n";				
					}
					
					pageNo++;
				}
				
				//3.다음
				if(pageNo <= totalPage) {
					pageBar += "<a href='"+request.getContextPath()+"/views//mypage/mypageCoupon?cPage="+pageNo+"'>[다음]</a>\n";							
				}
				
				//3.업무로직
				List<Coupon> cpnlist = new AdminService().selectCouponByMemberIdByPaging(memberId, cPage, numPerPage);
				List<CouponKind> list = new AdminService().selectCouponKindList(cPage, numPerPage);
				
				
				
				request.setAttribute("cpnlist",cpnlist);
				request.setAttribute("list",list);
				request.setAttribute("pageBar", pageBar);
				
				//4.view단처리
				request.getRequestDispatcher("/WEB-INF/views/mypage/mypageCoupon.jsp")
						.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
