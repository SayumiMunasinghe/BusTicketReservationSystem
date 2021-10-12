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
	//
	private BusDetails bd;
	private String cardNo;
	private int cusID;
	private int busid;
	private LocalTime convTime;
	private Time time;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusDBUtil bdu = new BusDBUtil();
		
		//when clicked proceed to payment after selecting number of seats to book
		if(request.getParameter("submit") != null) {
			
			HttpSession session = request.getSession();
			
			//if user has not logged in
			if(session.getAttribute("userID") == null || session.getAttribute("mode") == null){ 
				int loggedIn = 1;
				session.setAttribute("loggedIn", loggedIn);
				
				busid = Integer.parseInt(request.getParameter("busID"));
				String sttime = request.getParameter("time");
				
				reservedSeats = Integer.parseInt(request.getParameter("resSeat"));
				convTime = LocalTime.parse(sttime);
				
				double pricePerSeat = bdu.getPrice(busid, convTime);
				
				totalPrice = pricePerSeat * reservedSeats;
				bd = bdu.getDetails(busid, convTime);
				
				session.setAttribute("busid", busid);
				session.setAttribute("seats", reservedSeats);
				session.setAttribute("sttime", sttime);
				
				RequestDispatcher dis = request.getRequestDispatcher("PassengerLogin.jsp");
				dis.forward(request, response);
			}
			
			busid = Integer.parseInt(request.getParameter("busID"));
			String sttime = request.getParameter("time");
			
			reservedSeats = Integer.parseInt(request.getParameter("resSeat"));
			convTime = LocalTime.parse(sttime);
			
			double pricePerSeat = bdu.getPrice(busid, convTime);
			
			totalPrice = pricePerSeat * reservedSeats;
			bd = bdu.getDetails(busid, convTime);
			
			
			//get cusID from session
			cusID = (int)session.getAttribute("userID");
			
			//getting saved card numbers of customer to select for payment
			ArrayList<String> cardNos = bdu.getCardNumbers(cusID);
			
			request.setAttribute("busDetails", bd);
			request.setAttribute("seats", reservedSeats);
			request.setAttribute("date", SelectBusServlet.dateOfTravel);
			request.setAttribute("price", totalPrice);
			request.setAttribute("cardNos", cardNos);
			
			RequestDispatcher dis = request.getRequestDispatcher("payment.jsp");
			dis.forward(request, response);
		}
		
		//after choosing card and clicking paynow button
		if(request.getParameter("paynow") != null) {
			
			cardNo = request.getParameter("card");
			
			//converting LocalTime object to Time object
			time = Time.valueOf(convTime);
			//creating order object with overloaded constructor
			Order order = new Order(cusID, busid, cardNo, time, reservedSeats, totalPrice, SelectBusServlet.date);
			
			//CREATE
			boolean decision = bdu.insertBookingDetails(order);
			order.setOrderID(bdu.getOrderID());
			
			//if inserted to Order table successfully,
			if(decision == true) {
				request.setAttribute("order", order);
				RequestDispatcher dis = request.getRequestDispatcher("paymentDone.jsp");
				dis.forward(request, response);
			}
			else {
				HttpSession session = request.getSession();
				String flag = "false";
				session.setAttribute("flag", flag);
				RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
				dis.forward(request, response);
			}
			
		}
	}

}
