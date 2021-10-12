package com.btrs.enterBusDetails;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		busDBUtil busDB =new busDBUtil();
		
		//assigning new values into variables-----------------------------------------------------------------------------
		if(request.getParameter("Save") != null) {
		
		HttpSession session = request.getSession();
		//session to get agency id
		int aID = (int)session.getAttribute("userID");

		int id = Integer.parseInt(request.getParameter("rId"));
		String busNumber = request.getParameter("busNumber");
		int numberOfSeats = Integer.parseInt(request.getParameter("numberOfSeats"));
		String busType = request.getParameter("busType");
		String condition = request.getParameter("condition");
		String time = request.getParameter("time");
		String arrival = request.getParameter("arra");
		String destination = request.getParameter("des");
		double Price = Double.parseDouble(request.getParameter("price"));
		
		boolean isTrue;
		
		isTrue = busDB.updatebus(id,busNumber, numberOfSeats, busType, condition,time,arrival,destination, aID,Price);
		
		if(isTrue == true){
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}
	//getting current data to be updated------------------------------------------------------------------------
	if(request.getParameter("select") != null) {
		
		String stat = "1";
		
		HttpSession session = request.getSession();
		//session to get agency id
		int aID = (int)session.getAttribute("userID");

		ArrayList<String> busNumbers = busDB.getBusNumbers(aID);
		request.setAttribute("busNumbers", busNumbers);
		request.setAttribute("status", stat);
		
		RequestDispatcher dis = request.getRequestDispatcher("readBusDetails.jsp");
	    dis.forward(request, response);
		}
	//updating the new values---------------------------------------------------------------------------------
	if(request.getParameter("selectt") != null) {
		
		String busNumber = request.getParameter("bus");
		
		HttpSession session = request.getSession();
		//session to get agency id
		int aID = (int)session.getAttribute("userID");
		
		List<Bus> BusDetails = busDB.getBusDetails(busNumber,aID);
		request.setAttribute("BusDetails",BusDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("readBusDetails.jsp");
	    dis.forward(request, response);
	    
		}
	
	
	//function to delete bus from database
	if(request.getParameter("Remove Bus") != null) {
		
		HttpSession session = request.getSession();
		//session to get agency id
		int aID = (int)session.getAttribute("userID");
		
		String busNumber = request.getParameter("busNumber");
		boolean check = busDB.deleteBus(busNumber,aID);
		
		if(check == true) {
			RequestDispatcher dis =request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 =request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}
	
	}

}


