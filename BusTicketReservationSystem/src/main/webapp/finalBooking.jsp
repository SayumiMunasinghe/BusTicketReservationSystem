<%@ page import="com.btrs.homepage.Order" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Order order = (Order)request.getAttribute("order");
%>
<h1>Booking Summary</h1>
<p>Bus ID: <%= order.getBusID()%></p>
<p>Date of journey: <%= order.getDate() %></p>
<p>Time of Journey: <%= order.getTime() %></p>
<p>Number of seats reserved: <%= order.getReservedSeats() %></p>
<a href="homepage.jsp"><button>Back to homepage</button></a>
</body>
</html>