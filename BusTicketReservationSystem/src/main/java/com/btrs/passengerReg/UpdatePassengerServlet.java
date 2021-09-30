package com.btrs.passengerReg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePassengerServlet")
public class UpdatePassengerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//assigning data from jsp to a servlet is as below
		String pid = request.getParameter("passid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("tel");
		String password = request.getParameter("pwd");
		
		//passing values to update and we check if updated or not by variable returned
		boolean isUpdated = PassengerDBUtil.updatePassenger(pid, fname, lname, email, phone, password);
		
		//if updated go to success page ->>>>>>>>>> make it go to user account page and show a suceess message there
		if(isUpdated == true) {
			RequestDispatcher dis = request.getRequestDispatcher("passuccess.jsp");
			dis.forward(request, response);
		}else {
			//if not update go to fail page ->>>>>>>>>> make it go to user account page and show a fail retry message there
			RequestDispatcher dis = request.getRequestDispatcher("passfail.jsp");
			dis.forward(request, response);
		}
	}

}
