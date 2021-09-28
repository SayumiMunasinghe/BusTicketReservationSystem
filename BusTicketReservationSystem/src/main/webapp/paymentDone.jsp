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

	${order.orderID}

</body>
</html>