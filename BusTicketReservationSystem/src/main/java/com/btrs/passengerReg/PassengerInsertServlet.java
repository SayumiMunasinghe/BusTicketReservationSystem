package com.btrs.passengerReg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		
		//pass values from servelet to the model (passengerdbutil.java)
		
		Boolean isInserted;
		
		PassengerDBUtil pass= new PassengerDBUtil();
		
		//insertpassenger function returns boolean value
		isInserted = pass.insertPassenger(fname, lname, email, password, phone);
	
		//use if condition to check if inserted succesfully and dbconnection success
		//true -> insertion success
		if(isInserted == true) {			
			
			//sending success message if inserted to register jsp
			String posimsg = "1";
			request.setAttribute("msg", posimsg);	
			
			//use RequestDispatcher class to navigate from servelet to a jsp page
			RequestDispatcher rdis = request.getRequestDispatcher("passengerinsert.jsp");
			//so if the insertion success go to passucess.jsp
			rdis.forward(request, response);
			
		}else{
			///show re-enter details if registration fails
			String negimsg = "2";
			request.setAttribute("nmsg", negimsg);
			
			//if the insertion fail go to samepage
			RequestDispatcher rdis2 = request.getRequestDispatcher("passengerinsert.jsp");
			rdis2.forward(request, response);
		}
	}

}
