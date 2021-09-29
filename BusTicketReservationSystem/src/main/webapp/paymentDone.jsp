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
	<p>Payment successful</p><br>
	<form action="OrderManagementServlet" method="POST">
	<input type="hidden" name="orderid" value="${order.orderID}">
	<input type="submit" value="Delete Order" name="delete"> 
	</form>
	<p>If you delete your order, you will receive a 50% refund</p>

</body>
</html>