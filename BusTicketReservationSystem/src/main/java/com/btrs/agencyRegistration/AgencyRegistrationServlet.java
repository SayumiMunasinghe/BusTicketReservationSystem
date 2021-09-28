package com.btrs.agencyRegistration;

import java.io.IOException;
import java.util.List;

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
		String username = request.getParameter("userName");
		
		//Inserting data into database
		String status = AgencyDatabaseUtil.insertAgencyDetails(agentNIC, agentName, companyName, agentPhone, agentEmail, agencyLocation, password, username);
		if (status == "1") {
			RequestDispatcher d1 = request.getRequestDispatcher("AgencySuccess.jsp");
			d1.forward(request, response);
		} else if (status == "0"){
			RequestDispatcher d2 = request.getRequestDispatcher("result2.jsp");
			d2.forward(request, response);
		} else if (status == "username"){
			String popup = "1";
			request.setAttribute("popup", popup);
			RequestDispatcher d3 = request.getRequestDispatcher("agencyRegistration.jsp");
			d3.forward(request, response);
		}else if (status == "email"){
			String popup = "2";
			request.setAttribute("popup", popup);
			RequestDispatcher d5 = request.getRequestDispatcher("agencyRegistration.jsp");
			d5.forward(request, response);
		}
	}
}
