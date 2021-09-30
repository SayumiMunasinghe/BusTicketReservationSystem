package com.btrs.homepage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderManagementServlet")
public class OrderManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("delete") != null) {
			int orderid = Integer.parseInt(request.getParameter("orderid"));
			boolean status = BusDBUtil.deleteBooking(orderid);
			if(status == true) {
				String delete = "done";
				request.setAttribute("delete", delete);
				RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
				dis.forward(request, response);
			}
		}
	}

}
