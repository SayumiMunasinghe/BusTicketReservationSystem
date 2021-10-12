package com.btrs.enterBusDetails;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
		
		HttpSession session = request.getSession();
		//session to get agency id
		int aID = (int)session.getAttribute("userID");

		
		//inserttttt---------------------------------------------------------------------------------------------------
		
		//servlet catching the values entered through the form
		String busNumber = request.getParameter("number");
		int busSeat = Integer.parseInt(request.getParameter("seat"));
		String type = request.getParameter("btype");
		int condition = Integer.parseInt(request.getParameter("ac/nonac"));
		String upTime = request.getParameter("utime");
		String upArrival = request.getParameter("uarr");
		String upDestination = request.getParameter("udes");
		String downTime = request.getParameter("dtime");
		String downArrival = request.getParameter("darr");
		String downDestination = request.getParameter("ddes");
		double seatPrice =Double.parseDouble(request.getParameter("price"));
		
		boolean isTrue;
		busDBUtil busDB =new busDBUtil();
		isTrue = busDB.InsertBus(aID,busNumber, busSeat, type, condition,upTime,upArrival,upDestination,downTime, downArrival,downDestination,seatPrice);
		
		if(isTrue == true) {
			RequestDispatcher dis1 = request.getRequestDispatcher("success.jsp");
			dis1.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
	}

	

}
