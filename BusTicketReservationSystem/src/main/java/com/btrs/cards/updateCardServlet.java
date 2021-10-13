package com.btrs.cards;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateCardServlet")
public class updateCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	 //Create function to update card details when update button is pressed 

		if(request.getParameter("update")!=null) { 
		
		
		String cNum = request.getParameter("cno");
		String name = request.getParameter("hName"); 
		String cv = request.getParameter("cvv");
		String expD = request.getParameter("date");

		boolean check;
		
		check = cardsDBUtil.updateCard(cNum,name,cv,expD);
		if(check == true) {
			 
			 String posimsg = "1";
			 request.setAttribute("msg1", posimsg);
		     RequestDispatcher dis = request.getRequestDispatcher("ManagePayment.jsp");
		     dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
	}
		
		 //Create function to delete card details when delete button is pressed 

		if(request.getParameter("delete")!= null) {
			String cardNo = request.getParameter("cno");
	//assigning return value from db util to boolean check.
		boolean	check = cardsDBUtil.deleteCard(cardNo);
		
		if(check == true) {
			String posimsg = "1";
			request.setAttribute("msg2", posimsg);
			RequestDispatcher dis = request.getRequestDispatcher("ManagePayment.jsp");
		    dis.forward(request, response);
		    
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
	}
}

}
         

