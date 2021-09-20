package com.btrs.agencyRegistration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		}catch(Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher d4 = request.getRequestDispatcher("viewAgencyDetails.jsp");
		d4.forward(request, response);
	}

}
