package com.btrs.passengerReg;

import java.io.IOException;
import java.util.List;

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
		
		///////////////////get the data from db////////////
		if(request.getParameter("viewPassDetails") != null) {
			HttpSession session = request.getSession();
			int userID = (int) session.getAttribute("userID");
			try {
			List<Passenger> passDetails = PassengerDBUtil.CheckExist(userID);
			request.setAttribute("passDetails", passDetails);
			
			String loadOne = "1";
			request.setAttribute("loadOne", loadOne);
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("ManagePassenger.jsp");
			dis.forward(request, response);
			
		}
		
		
		///////////calling for update password function///////
		if(request.getParameter("updatePassword") != null) {
			HttpSession session = request.getSession();
			int userID = (int) session.getAttribute("userID");
			try {
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			
		}
			
		
		/////////////calling for the update phone function//////
		if(request.getParameter("updatePhone") != null) {
			HttpSession session = request.getSession();
			int userID = (int) session.getAttribute("userID");
			
			
			
		}
		
		
		/////calling for delete account function/////
		if(request.getParameter("delete") != null) {
			HttpSession session = request.getSession();
			int userID = (int) session.getAttribute("userID");
			
			Boolean status = PassengerDBUtil.DeletePassengerDetails(userID);
			session.removeAttribute("userID");
			session.removeAttribute("mode");
			
			if(status == true) {
				//goes to homepage if deleted
				RequestDispatcher dis1 = request.getRequestDispatcher("homepage.jsp");
				dis1.forward(request, response);
			}else{
				//if not delete will go back to same page
				//& on top of page will display a delete failed msg
				String msg = "1";
				request.setAttribute("msg", msg);
				RequestDispatcher dis2 = request.getRequestDispatcher("ManagePassenger.jsp");
				dis2.forward(request, response);
			}
		}
	}

}
