<%@page import="com.btrs.homepage.BusDBUtil, java.time.LocalDate, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<%
	LocalDate today = LocalDate.now();
	ArrayList<String> arrival = BusDBUtil.getArrival();
	ArrayList<String> destination = BusDBUtil.getDestination();
%>
<body>
<%  
	String flag = (String)request.getAttribute("flag");
	if(flag == "empty") {
		%><p>No buses available for your chosen route. Please enter different locations.</p><%
	}
	String status = (String)request.getAttribute("status");
	if (status == "false") {
	%>
		<p>Something went wrong with your order. Please try again</p><%
	}
	String delete = (String)request.getAttribute("delete");
	if (delete == "done") {
	%>
		<p>Your booking has been deleted. You will receive a refund within 2 working days.</p><%
	}
	String result = (String)request.getAttribute("result");
	if (delete == "fail") {
	%>
		<p>Your booking could not be updated.</p><%
	}
	String update = (String)request.getAttribute("update");
	if (update == "fail") {
	%>
		<p>There are no other booking times available.</p><%
	}
	%>
	<form action="SelectBusServlet" method="POST">
		<label>From: </label><br>
		<select id="arrival" name="arrival" required>
		<%
		for(int i = 0; i < arrival.size(); i++) {
		%>
			<option value="<%= arrival.get(i) %>"><%= arrival.get(i) %></option>
		<%
		}
		%>
		</select><br>
		<label>To: </label><br>
		<select id="destination" name="destination" required>
		<%
		for(int i = 0; i < destination.size(); i++) {
		%>
			<option value="<%= destination.get(i) %>"><%= destination.get(i) %></option>
		<%
		}
		%>
		</select><br>
		<label>Travel Date: </label><br>
		<input type="date" name="travelDate" min="<%= today%>" required><br>
		<input type="submit" name="submit" value="Find Bus">
	</form>
	<form class="form-horizontal" action="ManageAgencyDetailsServlet" method="Post">
    	<input type="submit" name="viewDetails" value="View Details" class="btn btn-default">
    </form>
</body>
</html>