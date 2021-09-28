<%@ page import="com.btrs.homepage.BusDBUtil, java.time.LocalTime, com.btrs.homepage.SelectBusServlet, java.util.List, com.btrs.homepage.BusDetails" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	List<BusDetails> bd = (List<BusDetails>)request.getAttribute("busDetails");

	for(int i = 0; i < bd.size(); i++) {
		out.println(bd.get(i).getBusID());
		out.println(bd.get(i).getBusNumber());
		out.println(bd.get(i).getNumberOfSeats());
		out.println(bd.get(i).getBusType());
		out.println(bd.get(i).getSeatPrice());
		out.println(bd.get(i).getAC());
		out.println(bd.get(i).getArrival());
		out.println(bd.get(i).getDestination());
		out.println(bd.get(i).getTime());
		
		int busid = bd.get(i).getBusID();
		String stTime = bd.get(i).getTime();
		
		LocalTime convTime = LocalTime.parse(bd.get(i).getTime());
		int seats = BusDBUtil.getRemainingSeats(busid, SelectBusServlet.dateOfTravel, convTime);
%>
		<form action="PaymentServlet" method="POST">
		<input type="hidden" name="busID" value="<%= busid%>">
		<input type="hidden" name="time" value="<%= stTime%>">
		Select number of seats to reserve: 
		<input type = "number" name="resSeat" min="1" max="<%= seats%>">
		<input type="submit" name="submit" value="Proceed to payment">
		</form>
<%
		
	}
	
%>
</body>
</html>