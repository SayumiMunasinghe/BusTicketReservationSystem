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
//		String fname = request.getParameter("fname");
//		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
//		String phone = request.getParameter("tel");
		String password = request.getParameter("pw");
		
		try {
			List<Passenger> passDetails= PassengerDBUtil.CheckExist(email, password);
			request.setAttribute("passDetails", passDetails);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("passengeracc.jsp");
		dis.forward(request, response);
	}

}
