package com.btrs.agencyRegistration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AgencyLoginServlet")
public class AgencyLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String password = request.getParameter("password");
		String username = request.getParameter("userName");
		 HttpSession session = request.getSession();
		try {
			AgencyDatabaseUtil objectName = new AgencyDatabaseUtil();
			int userID = objectName.checkLogin(username, password);
		      if (userID == -1) {
		    	  String popup = "1";
				  request.setAttribute("popup", popup);
		    	  RequestDispatcher d6 = request.getRequestDispatcher("AgencyLogin.jsp");
		  		  d6.forward(request, response);
		      }
		      session.setAttribute("userID", userID);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String mode = "agency";
		session.setAttribute("mode", mode);
		RequestDispatcher d4 = request.getRequestDispatcher("homepage.jsp");
		d4.forward(request, response);
	}
}




