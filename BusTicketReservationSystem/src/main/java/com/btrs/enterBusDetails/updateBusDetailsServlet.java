package com.btrs.enterBusDetails;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateBusDetailsServlet
 */
@WebServlet("/updateBusDetailsServlet")
public class updateBusDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String busNumber = request.getParameter("busNumber");
		int numberOfSeats = Integer.parseInt(request.getParameter("busNumber"));
		String busType = request.getParameter("busType");
		String condition = request.getParameter("condition");
		
		boolean isTrue;
		
		isTrue = busDBUtil.updatebus(busNumber, numberOfSeats, busType, condition);
		
		if(isTrue == true){
			RequestDispatcher dis = request.getRequestDispatcher("readBusDetails.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
