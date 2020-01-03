package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

/**
 * Servlet Filter implementation class MemberAuthFilter
 */
@WebFilter( servletNames = {
		/*"MypageReviewServlet",
		"MypageViewCouponServlet",
		"MypageViewServlet"*/
	},
	urlPatterns = {
			/*"/mypage/main"*/
			/*"/mypage/update",
			"/mypage/questionList",
			"/mypage/updatePassword"*/
	})
public class MemberAuthFilter implements Filter {

    /**
     * Default constructor. 
     */
    public MemberAuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 * 
	 * 로그인한 사용자가 다른 사용자의 상세보기페이지를 요청하는 경우를 방지한다.
	 * 
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//로그인한 사용자의 아이디 == memberView?memberId 
		HttpSession session = ((HttpServletRequest)request).getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		//상세보기 요청사용자
		String viewMemberId =  ((HttpServletRequest)request).getParameter("memberId");
		System.out.println("viewMemberId@filter="+viewMemberId);
		
		if(memberLoggedIn==null
		 || !(memberLoggedIn.getMemberId().equals(viewMemberId)
			   ||"admin".equals(memberLoggedIn.getMemberId()))) {
			request.setAttribute("msg", "로그인 후 마이페이지를 통해 이용가능한 페이지입니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				   .forward(request, response);
			return;
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		
		
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
