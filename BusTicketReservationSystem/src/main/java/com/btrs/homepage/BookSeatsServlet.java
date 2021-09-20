package com.btrs.homepage;

import java.io.IOException;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookSeatsServlet")
public class BookSeatsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int busID = Integer.parseInt(request.getParameter("busID"));
		String time = request.getParameter("time");
		
		LocalTime convTime = LocalTime.parse(time);
		
	}

}
