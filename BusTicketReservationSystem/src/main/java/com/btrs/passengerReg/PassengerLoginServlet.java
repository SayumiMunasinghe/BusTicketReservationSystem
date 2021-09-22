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

		
		try {
			int pid= PassengerDBUtil.CheckExist(email, password);
			//pass obj
//			request.setAttribute("passDetails", passDetails);
			session.setAttribute("userID", pid);
			String mode = "passenger";
			session.setAttribute("mode", mode);
		}
		catch(Exception e) {
			//print the exeception if there is one
			e.printStackTrace();
		}
		
		//allows a servlet to navigate to a jsp page
		RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
		dis.forward(request, response);
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
