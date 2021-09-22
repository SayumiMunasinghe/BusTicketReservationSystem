package com.btrs.passengerReg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/PassengerInsertServlet")
public class PassengerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//these variables used to hold the values sent from the passengerinsert.jsp(view)
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		String phone = request.getParameter("telno");
		HttpSession session = request.getSession();
		
		//use passengerdbutil class to call the insert function
		//pass values from servelet to the model (passengerdbutil.java)
		
		Boolean isInserted;
		
		//insertpassenger function returns boolean value
		isInserted = PassengerDBUtil.insertPassenger(fname, lname, email, password, phone);
	
		//use if condition to check if inserted succesfully and dbconnection success
		//true -> insertion success
		if(isInserted == true) {
			int pid = PassengerDBUtil.getID(email);
			session.setAttribute("userID", pid);
			String mode = "passenger";
			session.setAttribute("mode", mode);
			
			//use RequestDispatcher class to navigate from servelet to a jsp page
			RequestDispatcher rdis = request.getRequestDispatcher("passucess.jsp");
			//so if the insertion success go to passucess.jsp
			rdis.forward(request, response);
			
		}else {
			//if the insertion fail go to passfail.jsp
			RequestDispatcher rdis2 = request.getRequestDispatcher("passfail.jsp");
			rdis2.forward(request, response);
		}
	}

}
