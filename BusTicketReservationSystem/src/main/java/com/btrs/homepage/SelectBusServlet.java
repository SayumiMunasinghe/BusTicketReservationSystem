package com.btrs.homepage;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SelectBusServlet")
public class SelectBusServlet extends HttpServlet {
	public static Date travelDate;
	public static String dateOfTravel;
	public static LocalDate date;
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("dropdowns") != null) {
			try {
				String x = "1";
				ArrayList<String> arrival = BusDBUtil.getArrival();
				ArrayList<String> destination = BusDBUtil.getDestination();
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
				List<BusDetails> busDetails = BusDBUtil.sendDetails(arrival, destination);
			
				if(busDetails.isEmpty()) {
					String flag = "empty";
					request.setAttribute("flag", flag);
					RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
					dis.forward(request, response);
				}
				for(int i = 0; i < busDetails.size(); i++) {
					int seats = BusDBUtil.getRemainingSeats(busDetails.get(i).getBusID(), dateOfTravel, LocalTime.parse(busDetails.get(i).getTime()));
					if(seats == 0)
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
