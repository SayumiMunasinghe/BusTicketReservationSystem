package com.agencyRegistration;

import java.io.IOException;
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
		
		
	}

}
