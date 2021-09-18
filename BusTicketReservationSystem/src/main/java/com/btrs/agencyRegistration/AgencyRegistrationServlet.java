package com.btrs.agencyRegistration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AgencyRegistrationServlet")
public class AgencyRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String agentNIC = request.getParameter("agentNIC");
		String agentName = request.getParameter("agentName");
		String companyName = request.getParameter("companyName");
		String agentPhone = request.getParameter("agentPhone");
		String agentEmail = request.getParameter("agentEmail");
		String agencyLocation = request.getParameter("agencyLocation");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String username = request.getParameter("userName");
		
		String status = AgencyDatabaseUtil.insertAgencyDetails(agentNIC, agentName, companyName, agentPhone, agentEmail, agencyLocation, password, confirmPassword, username);
//		boolean status1 = AgencyDatabaseUtil.insertAgencyDetails("123456789", "agentName", "companyName", "agentPhone", "agentEmail", "agencyLocation", "password", "confirmPasswor" , "username");
		
		if (status == "1") {
			//this will send to another JSP
			RequestDispatcher d1 = request.getRequestDispatcher("result1.jsp");
			d1.forward(request, response);
		} else if (status == "0"){
			RequestDispatcher d2 = request.getRequestDispatcher("result2.jsp");
			d2.forward(request, response);
		} else if (status == "username"){
			RequestDispatcher d3 = request.getRequestDispatcher("result3.jsp");
			d3.forward(request, response);
		}
		
	}

}
