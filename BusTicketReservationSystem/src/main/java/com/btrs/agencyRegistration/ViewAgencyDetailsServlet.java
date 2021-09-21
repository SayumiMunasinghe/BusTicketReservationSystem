package com.btrs.agencyRegistration;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ViewAgencyDetailsServlet")
public class ViewAgencyDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		String mode = (String)session.getAttribute("mode");
		int userID = (int) session.getAttribute("userID");
		
		if(userID == -1) {
	    	  String popup = "1";
			  request.setAttribute("popup1", popup);
	    	  RequestDispatcher d6 = request.getRequestDispatcher("viewAgencyDetails.jsp");
	  		  d6.forward(request, response);
		}
		
		try {
			List<AgencyDetails> agencyListDetails = AgencyDatabaseUtil.viewAgencyData(userID);
			request.setAttribute("agencyListDetails", agencyListDetails);
			
			boolean ans = agencyListDetails.isEmpty();
		      if (ans == true) {
		    	  String popup = "1";
				  request.setAttribute("popup1", popup);
		    	  RequestDispatcher d6 = request.getRequestDispatcher("viewAgencyDetails.jsp");
		  		  d6.forward(request, response);
		      }
		    	   
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher d6 = request.getRequestDispatcher("viewAgencyDetails.jsp");
		d6.forward(request, response);
	}

}


