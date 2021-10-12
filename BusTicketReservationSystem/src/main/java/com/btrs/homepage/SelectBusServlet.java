package com.btrs.homepage;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.time.LocalDate;
import java.time.ZoneId;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SelectBusServlet")
public class SelectBusServlet extends HttpServlet {
	public  Date travelDate;
	public static String dateOfTravel;
	public static LocalDate date;
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//on auto load of home page, get the drop-downs 
		BusDBUtil bdu = new BusDBUtil();
		if(request.getParameter("dropdowns") != null) {
			try {
				String x = "1";
				ArrayList<String> arrival = bdu.getArrival();
				ArrayList<String> destination = bdu.getDestination();
				request.setAttribute("arrival", arrival);
				request.setAttribute("destination", destination);
				request.setAttribute("x", x);
				RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
				dis.forward(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(request.getParameter("submit") != null) {
			String arrival = request.getParameter("arrival");
			String destination = request.getParameter("destination");
			dateOfTravel = request.getParameter("travelDate");
			
			try {
				travelDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfTravel);
				date = travelDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
				List<BusDetails> busDetails = bdu.sendDetails(arrival, destination);
			
				if(busDetails.isEmpty()) {
					HttpSession session = request.getSession();
					String flag = "empty";
					session.setAttribute("flag", flag);
					
					RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
					dis.forward(request, response);
				}
				for(int i = 0; i < busDetails.size(); i++) {
					if(busDetails.get(i).getRemainingSeats() == 0)
						busDetails.remove(i);
				}
				request.setAttribute("busDetails", busDetails);
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher dis = request.getRequestDispatcher("availableBuses.jsp");
			dis.forward(request, response);
		}
	}	
}
