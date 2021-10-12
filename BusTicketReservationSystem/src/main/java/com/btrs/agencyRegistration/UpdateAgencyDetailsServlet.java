package com.btrs.agencyRegistration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAgencyDetailsServlet")
public class UpdateAgencyDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String agentNIC = request.getParameter("agentNIC");
		String agentName = request.getParameter("agentName");
		String companyName = request.getParameter("companyName");
		String agentPhone = request.getParameter("agentPhone");
		String agentEmail = request.getParameter("agentEmail");
		String agencyLocation = request.getParameter("agencyLocation");
		String password = request.getParameter("password");
		String username = request.getParameter("userName");
		
		AgencyDatabaseUtil objectName = new AgencyDatabaseUtil();
		String status = objectName.insertAgencyDetails(agentNIC, agentName, companyName, agentPhone, agentEmail, agencyLocation, password, username);
	    
		
	}

}
