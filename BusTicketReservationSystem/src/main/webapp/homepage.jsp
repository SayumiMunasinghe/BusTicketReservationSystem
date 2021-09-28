<%@page import="java.time.LocalDate"%>
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
	%>
	<form action="SelectBusServlet" method="POST">
		<label>From: </label><br>
		<input type="text" name="arrival" required><br>
		<label>To: </label><br>
		<input type="text" name="destination" required><br>
		<label>Travel Date: </label><br>
		<input type="date" name="travelDate" min="<%= today%>" required><br>
		<input type="submit" name="submit" value="Find Bus">
	</form>
	<a href = "ManageAgencyDetails.jsp"> <button>Manage agency details</button> </a>
</body>
</html>