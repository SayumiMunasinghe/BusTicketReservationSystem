package com.btrs.passengerReg;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PassengerRegServlet")
public class PassengerRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//take the values sent from PassengerLogin.jsp and store in below variables
		String email = request.getParameter("email");
		String password = request.getParameter("pw");
		
		try {
			List<Passenger> passDetails= PassengerDBUtil.CheckExist(email, password);
			request.setAttribute("passDetails", passDetails);
		}
		catch(Exception e) {
			//print the exeception if there is one
			e.printStackTrace();
		}
		
		//allows a servlet to navigate to a jsp page
		RequestDispatcher dis = request.getRequestDispatcher("passengeracc.jsp");
		dis.forward(request, response);
	}

}
