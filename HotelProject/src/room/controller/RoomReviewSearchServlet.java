package room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import review.model.service.ReviewService;
import review.model.vo.ReviewM;


/**
 * Servlet implementation class RoomReviewSearchServlet
 */
@WebServlet("/room/searchReview")
public class RoomReviewSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReviewSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청 인코딩처리
		request.setCharacterEncoding("utf-8");
		
		//2.파라미터값  가져오기
		String rvSrch = request.getParameter("rvSrch");
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
		System.out.println("rvSrch="+rvSrch);
		System.out.println("roomNo="+roomNo);
		
		
		//3.비지니스로직처리 : 해당하는 User찾기
		List<ReviewM> list = new ReviewService().selectReviewbyRoomNo(roomNo);
		
		JSONArray jsonArray = new JSONArray();
		
		for(ReviewM r : list) {
			System.out.println(r);
			System.out.println(r.getMemberName());
			if(r.getMemberName().contains(rvSrch) || 
			   r.getReviewContent().contains(rvSrch) || 
			   r.getReviewDate().toString().contains(rvSrch)
			   ) {
				JSONObject jsonMember = new JSONObject();
				jsonMember.put("name", r.getMemberName());
				jsonMember.put("content", r.getReviewContent());
				jsonMember.put("date", r.getReviewDate().toString());
				jsonArray.add(jsonMember);
			}
		}
		System.out.println(jsonArray);
		
		//4.응답객체에 출력
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		out.print(jsonArray);	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
