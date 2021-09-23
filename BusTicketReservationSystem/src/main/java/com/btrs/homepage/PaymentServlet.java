package com.btrs.homepage;

import java.io.IOException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int reservedSeats;
	private double totalPrice;
	//make the others also private
	BusDetails bd;
	String cardNo;
	int cusID;
	int busid;
	LocalTime convTime;
	//for sql inserting
	Time time;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("submit") != null) {
			HttpSession session = request.getSession();
			//get cusID from session
	//		int cusID = (int)session.getAttribute("userID");
			cusID = 1;
			busid = Integer.parseInt(request.getParameter("busID"));
			String sttime = request.getParameter("time");
			
			reservedSeats = Integer.parseInt(request.getParameter("resSeat"));
			convTime = LocalTime.parse(sttime);
			
			double pricePerSeat = BusDBUtil.getPrice(busid, convTime);
			
			totalPrice = pricePerSeat * reservedSeats;
			bd = BusDBUtil.getDetails(busid, convTime);
			
			request.setAttribute("busDetails", bd);
			request.setAttribute("seats", reservedSeats);
			request.setAttribute("date", SelectBusServlet.dateOfTravel);
			request.setAttribute("price", totalPrice);
			
			ArrayList<String> cardNos = BusDBUtil.getCardNumbers(cusID);
			
			request.setAttribute("cardNos", cardNos);
			
			RequestDispatcher dis = request.getRequestDispatcher("payment.jsp");
			dis.forward(request, response);
		}
		if(request.getParameter("paynow") != null) {
			cardNo = request.getParameter("card");
			time = Time.valueOf(convTime);
			Order order = new Order(cusID, busid, cardNo, time, reservedSeats, totalPrice, SelectBusServlet.date);
			String status;
			
			boolean decision = BusDBUtil.insertBookingDetails(order);
			order.setOrderID(BusDBUtil.orderID);
			if(decision == true) {
				request.setAttribute("order", order);
				RequestDispatcher dis = request.getRequestDispatcher("paymentDone.jsp");
				dis.forward(request, response);
			}
			else {
				status = "false";
				request.setAttribute("status", status);
				RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
				dis.forward(request, response);
			}
			
		}
	}

}
