package com.btrs.cards;

import java.io.IOException;
import java.util.List;

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
			 List<cardDetails> cardDet = cardsDBUtil.getcardDetails(id,cardID);
			 request.setAttribute("cardDet", cardDet);
			
		     RequestDispatcher dis = request.getRequestDispatcher("Success.jsp");
		     dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
	}

}


//HttpSession session = request.getSession();
//Session for user ID
//session.setAttribute("userID", userID);
//session.setAttribute("mode", mode);

//to retrive session
//int test = (int)session.getAttribute("userID");

//to delete session
//session.removeAttribute("mode");
