package com.btrs.cards;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addCardServlet")
public class addCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int pid = 1;
		String cNO =request.getParameter("cno").replaceAll("[a-zA-Z]", "");
    	String cType = request.getParameter("type");
		String cvv = request.getParameter("cvv").replaceAll("[a-zA-Z]", "");
		String cHName = request.getParameter("hName");
		String date = request.getParameter("date").replaceAll("[a-zA-Z]", "");
		
		boolean check;
		
		check = cardsDBUtil.addCard(pid,cNO, cHName, cType, cvv, date);
		
		if(check == true) {
		     RequestDispatcher dis = request.getRequestDispatcher("result1.jsp");
		     dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
	}

}
