package notice.controller;

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

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class JsonNoticeSearch
 */
@WebServlet("/notice/jsonNoticeSearch")
public class JsonNoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.요청 인코딩처리
		request.setCharacterEncoding("utf-8");

		// 2.파라미터값 가져오기
		String noticeSearch = request.getParameter("noticeSearch");
		String searchType = request.getParameter("searchType");

		System.out.println("searchType=" + searchType);
		final int numPerPage = 5;
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {

		}
		
		// 3.비지니스로직처리 : 해당하는 제목 찾기
		List<Notice> list = new NoticeService().selectNoticeSearch(noticeSearch,searchType);
		
		
		
		JSONArray jsonArray = new JSONArray();

		for (Notice n : list) {
			JSONObject jsonNotice = new JSONObject();
			jsonNotice.put("no", String.valueOf(n.getNoticeNo()));
			jsonNotice.put("title", n.getNoticeTitle());
			jsonNotice.put("filename", n.getNoticeOriginalFileName());
			jsonNotice.put("date", (n.getNoticeDate()).toString());
			jsonNotice.put("readcnt", String.valueOf(n.getNoticeReadCount()));
			jsonArray.add(jsonNotice);
		}
		System.out.println("jsonArray=" + jsonArray);

		// 4.응답객체에 출력
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonArray);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
