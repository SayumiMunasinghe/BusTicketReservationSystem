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
		
		//Reading data from database and view it
		try {
			List<AgencyDetails> agencyListDetails = AgencyDatabaseUtil.checkExistData(username, password);
			request.setAttribute("agencyListDetails", agencyListDetails);
			
			boolean ans = agencyListDetails.isEmpty();
		      if (ans == true) {
		    	  String popup = "1";
				  request.setAttribute("popup", popup);
		    	  RequestDispatcher d6 = request.getRequestDispatcher("AgencyLogin.jsp");
		  		  d6.forward(request, response);
		      }
		    	  
		    	  
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//to make session
		HttpSession session = request.getSession();
		String mode = "agency";
		session.setAttribute("mode", mode);
		
		//to retrive session
//		String test = (String)session.getAttribute("mode");
		
		//to delete session
//		session.removeAttribute("mode");
		
		
		RequestDispatcher d4 = request.getRequestDispatcher("viewAgencyDetails.jsp");
		d4.forward(request, response);
	}

}


