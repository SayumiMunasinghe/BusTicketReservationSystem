package com.btrs.cards;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateCustomerServlet
 */
@WebServlet("/updateCustomerServlet")
public class updateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 1;
		String type = request.getParameter("cardType");
		String cNum = request.getParameter("cno");
		String name = request.getParameter("hName"); 
		String cv = request.getParameter("cvv");
		String expD = request.getParameter("date");
		
		boolean check;
		
		check = cardsDBUtil.updateCard(id,type ,cNum,name,cv,expD );
		if(check == true) {
		     RequestDispatcher dis = request.getRequestDispatcher("result1.jsp");
		     dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
	}

}
