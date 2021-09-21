package com.btrs.agencyRegistration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@WebServlet("/AgencyLoginServlet")
public class AgencyLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String password = request.getParameter("password");
		String username = request.getParameter("userName");
		 HttpSession session = request.getSession();
		
		try {
			int userID = AgencyDatabaseUtil.checkLogin(username, password);
//			request.setAttribute("agencyListDetails", agencyListDetails);
			
//			boolean ans = agencyListDetails.isEmpty();
		      if (userID == -1) {
		    	  String popup = "1";
				  request.setAttribute("popup", popup);
		    	  RequestDispatcher d6 = request.getRequestDispatcher("AgencyLogin.jsp");
		  		  d6.forward(request, response);
		      }
		      
		      //Session for user ID
		      session.setAttribute("userID", userID);
		  
		      System.out.println(userID);
  
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//Sesiion for mode to see if it's an Agent or a customer
		String mode = "agency";
		session.setAttribute("mode", mode);
		
		// PUT HOME PAGE TO HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
		RequestDispatcher d4 = request.getRequestDispatcher("viewAgencyDetails.jsp");
		d4.forward(request, response);
	}

}




//to retrive session
//String test = (String)session.getAttribute("mode");

//to delete session
//session.removeAttribute("mode");



