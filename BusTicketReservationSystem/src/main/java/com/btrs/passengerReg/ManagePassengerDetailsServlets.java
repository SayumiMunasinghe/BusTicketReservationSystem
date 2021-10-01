package com.btrs.passengerReg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ManagePassengerDetailsServlets")
public class ManagePassengerDetailsServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(request.getParameter("delete") != null) {
			HttpSession session = request.getSession();
			int userID = (int) session.getAttribute("userID");
			
			Boolean status = PassengerDBUtil.DeletePassengerDetails(userID);
			session.removeAttribute("userID");
			session.removeAttribute("mode");
			
			if(status == true) {
				System.out.println("deleted");
//				RequestDispatcher dis1 = request.getRequestDispatcher("homepage.jsp");
//				dis1.forward(request, response);
			}else {
				System.out.println("failed");
//				RequestDispatcher dis2 = request.getRequestDispatcher("ManagePassenger.jsp");
//				dis2.forward(request, response);
			}
		}
	}

}
