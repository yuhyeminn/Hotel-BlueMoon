package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import reservation.model.vo.ReservationCount;

/**
 * Servlet implementation class AdminTotalServlet
 */
@WebServlet("/admin/total")
public class AdminTotalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchType = request.getParameter("searchType");
		List<ReservationCount> selectMonth = new AdminService().selectMonth();
		List<ReservationCount> rcYearList = new AdminService().selectResvCountYear();
				
		request.setAttribute("selectMonth", selectMonth);
		request.setAttribute("rcYearList", rcYearList);
		request.setAttribute("searchType", searchType);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/adminTotal.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
