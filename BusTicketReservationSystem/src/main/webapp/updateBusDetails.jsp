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
	int busSeat = Integer.parseInt(request.getParameter("numberOfSeats"));
	String type = request.getParameter("busType");
	String condition = request.getParameter("condition");
	
	%>

<form action="updateBusDetailsServlet" method="POST">

	Bus No. : <input type="text"  name="busNumber" value="<%=busNumber %>"><br>
	
	Number of seats : <input type="text"  name="numberOfSeats" value="<%=busSeat%>"><br>
	
	Bus Type : <input type="text"  name="busType" value="<%= type%>"><br>
	
	
	Condition : <input type="text"  name="condition" value="<%=condition %>"><br>


<input type="submit" name="submit" value="Edit Bus Details">










</form>

</body>
</html>