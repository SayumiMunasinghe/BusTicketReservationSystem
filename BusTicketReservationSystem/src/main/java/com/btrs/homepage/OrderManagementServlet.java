package com.btrs.homepage;

import java.io.IOException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.btrs.enterBusDetails.busDBUtil;

@WebServlet("/OrderManagementServlet")
public class OrderManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("delete") != null) {
			int orderid = Integer.parseInt(request.getParameter("orderid"));
			boolean status = BusDBUtil.deleteBooking(orderid);
			if (status == true) {
				HttpSession session = request.getSession();
				String flag = "done";
				session.setAttribute("flag", flag);
				RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
				dis.forward(request, response);
			}
			if (status == false) {
				String delete = "fail";
				request.setAttribute("delete", delete);
				RequestDispatcher dis = request.getRequestDispatcher("paymentDone.jsp");
				dis.forward(request, response);
			}
		}
		if(request.getParameter("update") != null) {
			int orderid = Integer.parseInt(request.getParameter("orderid"));
			Order order = BusDBUtil.getOrderDetails(orderid);
			int busid = order.getBusID();
			LocalTime tempTime = order.getTime().toLocalTime();
			String tempDate = order.getDate().toString();
			BusDetails bd  = BusDBUtil.getDetails(busid, tempTime);
			String arrival = bd.getArrival();
			String destination = bd.getDestination();
			String busType = bd.getBusType();
			ArrayList<BusTimes> btl = BusDBUtil.getTimes(arrival, destination, busType);
			
			for(int i = 0; i < btl.size(); i++) {
				BusTimes bt = btl.get(i);
				if(BusDBUtil.getRemainingSeats(bt.getBusid(), tempDate, tempTime) < order.getReservedSeats()) {
					btl.remove(i);
				}
				if((bt.getBusid() == busid) && bt.getTime().equals(order.getTime())) {
					btl.remove(i);
				}
			}
			
			request.setAttribute("busTimes", btl);
			request.setAttribute("order", order);
;			RequestDispatcher dis = request.getRequestDispatcher("updatePayment.jsp");
			dis.forward(request, response);
		}
		if(request.getParameter("updateTime") != null) {
			String val = request.getParameter("time");
			String[] temp = val.split(" ");
			String sttime = temp[0];
			int busid = Integer.parseInt(temp[1]);
			int orderid = Integer.parseInt(request.getParameter("orderid"));
			LocalTime time = LocalTime.parse(sttime);
			Time orTime = Time.valueOf(time);
			boolean status = BusDBUtil.updateBooking(orderid, busid, orTime);
			if(status==true) {
				Order finalOrder = BusDBUtil.getOrderDetails(orderid);
				request.setAttribute("order", finalOrder);
				RequestDispatcher dis = request.getRequestDispatcher("finalBooking.jsp");
				dis.forward(request, response);
			}
			else {
				HttpSession session = request.getSession();
				String flag = "fail";
				session.setAttribute("flag", flag);
				RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
				dis.forward(request, response);
			}
		}
	}

}
