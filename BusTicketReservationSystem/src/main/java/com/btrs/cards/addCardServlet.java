package com.btrs.cards;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/addCardServlet")
public class addCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int pid;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		pid =(int) session.getAttribute("userID");
		if(request.getParameter("submit")!= null) {
       
		
		String cNO =request.getParameter("cno").replaceAll("[a-zA-Z--]", "");
    	String cType = request.getParameter("type");
		String cvv = request.getParameter("cvv").replaceAll("[a-zA-Z]", "");
		String cHName = request.getParameter("hName");
		String date = request.getParameter("date").replaceAll("[a-zA-Z]", "");
		
		int set=1;
		boolean check;
		
		check = cardsDBUtil.addCard(cNO,cType, cHName,cvv, date,pid);
		
		if(check == true) {
			
			
		     RequestDispatcher dis = request.getRequestDispatcher("ManagePayment.jsp");
		     dis.forward(request, response);
		   
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
		
    }
   


if(request.getParameter("submit1")!=null) {
        
	    String stat = "1";
	    
	   
		 ArrayList<String> cardNos = cardsDBUtil.getCardNumbers(pid);
	      request.setAttribute("cardNos", cardNos);
	      request.setAttribute("status",stat);
		RequestDispatcher dis = request.getRequestDispatcher("ManagePayment.jsp");
	    dis.forward(request, response);
	   
	    
	
 }

if(request.getParameter("select")!=null) {
    String cardNo=request.getParameter("card");
    String stat = "1";
    
   
	List<cardDetails> cardDetails = cardsDBUtil.viewCardDetails(cardNo);
	request.setAttribute("cardDetails", cardDetails);
	
      
	RequestDispatcher dis = request.getRequestDispatcher("ManagePayment.jsp");
    dis.forward(request, response);
   
    request.setAttribute("stats",stat);

}

	
	}
}


