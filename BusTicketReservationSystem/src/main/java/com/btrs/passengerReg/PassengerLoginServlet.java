package com.btrs.passengerReg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PassengerLoginServlet")
public class PassengerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//take the values sent from PassengerLogin.jsp and store in below variables
		String email = request.getParameter("email");
		String password = request.getParameter("pw");
		HttpSession session = request.getSession();
		
		int passengerid = -1;
		
		try {
				PassengerDBUtil pass= new PassengerDBUtil();
				int pid= pass.checkLogin(email, password);
		
				passengerid = pid;
		}
		catch(Exception e) {
				//print the exeception if there is one
				e.printStackTrace();
		}
		
		if(passengerid > 0) {
			session.setAttribute("userID", passengerid);
			String mode = "passenger";
			session.setAttribute("mode", mode);
			
			////show success message if logged in successfully
			String posimsg = "1";
			request.setAttribute("pmsg", posimsg);
			
			if(session.getAttribute("loggedIn") == null){
				//allows a servlet to navigate to a jsp page
				RequestDispatcher dis = request.getRequestDispatcher("PassengerLogin.jsp");
				dis.forward(request, response);
			}
			else {
				RequestDispatcher dis = request.getRequestDispatcher("payment.jsp");
				dis.forward(request, response);
			}
			
		}else{
			
			///show re-enter details if login fails 
			String negimsg = "2";
			request.setAttribute("nmsg", negimsg);
			
			//if email or pw doesnot match data in db will redirect to the login form
			RequestDispatcher dis = request.getRequestDispatcher("PassengerLogin.jsp");
			dis.forward(request, response);
			
		}
	}
	
	//Session for user ID
//	session.setAttribute("userID", userID);
//	session.setAttribute("mode", mode);
	
//	//to retrive session
//	String test = (String)session.getAttribute("mode");
//
//	//to delete session
//	session.removeAttribute("mode")


}
