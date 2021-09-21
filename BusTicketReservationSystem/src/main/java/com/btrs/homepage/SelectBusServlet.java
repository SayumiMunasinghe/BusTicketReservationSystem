package com.btrs.homepage;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SelectBusServlet")
public class SelectBusServlet extends HttpServlet {
	private static Date travelDate;
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String arrival = request.getParameter("arrival");
		String destination = request.getParameter("destination");
		String dateOfTravel = request.getParameter("travelDate");
	
		try {
			travelDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfTravel);
			List<BusDetails> busDetails = BusDBUtil.sendDetails(arrival, destination);
			
			if(busDetails.isEmpty()) {
				String flag = "empty";
				request.setAttribute("flag", flag);
				RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
				dis.forward(request, response);
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
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
		System.out.println(req.getParameter("busID"));
	}
	
}
