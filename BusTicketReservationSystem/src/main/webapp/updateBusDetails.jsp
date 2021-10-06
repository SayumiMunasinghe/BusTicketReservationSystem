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
	
	String busNumber = request.getParameter("busNumber");
	String busSeat = request.getParameter("seats");
	String type = request.getParameter("type");
	String condition = request.getParameter("condition");
	String time = request.getParameter("time");
	String arrival = request.getParameter("arr");
	String destination = request.getParameter("dest");
	String seatPrice =request.getParameter("price");
	%> 

<form action="updateBusDetailsServlet" method="POST">

	Bus No. : <input type="text"  name="busNumber" value="<%=busNumber %>"><br>
	Number of seats : <input type="text"  name="numberOfSeats" value="<%=busSeat%>"><br>
	Bus Type : <input type="text"  name="busType" value="<%= type%>"><br>
	Condition : <input type="text"  name="condition" value="<%=condition %>"><br>
	Time :  <input type="text"  name="time" value="<%=time %>"><br>
	Arrival :  <input type="text"  name="arra" value="<%=arrival %>"><br>
	Destination :  <input type="text"  name="des" value="<%=destination %>"><br>
	Seat Price :  <input type="text"  name="price" value="<%=seatPrice %>"><br>
	
	

<input type="submit" name="submit" value="Edit Bus Details">










</form>

</body>
</html>