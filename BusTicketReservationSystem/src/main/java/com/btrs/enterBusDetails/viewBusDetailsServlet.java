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
 * Servlet implementation class viewBusDetailsServlet
 */
@WebServlet("/viewBusDetailsServlet")
public class viewBusDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("view") != null) {
		HttpSession session = request.getSession();
		//session to get agency id
		//int aID = (int)session.getAttribute("userID");
		int aID= 2;
		
		String stat = "1";
		try {
			List <Bus> busDetails = busDBUtil.getBusDetails(aID);
			request.setAttribute("busDetails", busDetails);
			request.setAttribute("stats",stat);
//			System.out.println(id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dis = request.getRequestDispatcher("readBusDetails.jsp");
		dis.forward(request, response);
		
		}
		
		
	
		
		
	}

}
