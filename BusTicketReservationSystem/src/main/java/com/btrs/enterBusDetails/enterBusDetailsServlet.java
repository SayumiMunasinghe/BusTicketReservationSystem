package com.btrs.enterBusDetails;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class enterBusDetailsServlet
 */
@WebServlet("/enterBusDetailsServlet")
public class enterBusDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//HttpSession session = request.getSession();
		//session to get agency id
		//nt aID = (int)session.getAttribute("aid");
		
		//inserttttt--------------------------------------
		String busNumber = request.getParameter("number");
		int busSeat = Integer.parseInt(request.getParameter("seat"));
		String type = request.getParameter("btype");
		String condition = request.getParameter("ac/nonac");
		//String day = request.getParameter("days");
		
		boolean isTrue;
		
		isTrue = busDBUtil.InsertBus(busNumber, busSeat, type, condition);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
	}

	

}
