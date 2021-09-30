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
	String delete = (String)request.getAttribute("delete");
	if (delete == "fail") {
%>
	<p>Your booking could not be deleted. Please try again</p><%
	}

%>
	<p>Payment successful</p><br>
	<p>If you delete your booking, you will receive a 50% refund</p>
	<form action="OrderManagementServlet" method="POST">
		<input type="hidden" name="orderid" value="${order.orderID}">
		<input type="submit" value="Delete Booking" name="delete"> 
	</form>
	<p>You can choose to update your booking time. You will be redirected to the homepage if there are no other possible booking times.</p>
	<form action="OrderManagementServlet" method="POST">
		<input type="hidden" name="orderid" value="${order.orderID}">
		<input type="submit" value="Update Booking" name="update">
	</form>
</body>
</html>