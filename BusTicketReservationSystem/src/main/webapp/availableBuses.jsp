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
	<c:forEach var="bus" items="${cusDetails}">
		${bus.busID}
		${bus.busNumber}
		${bus.numberOfSeats}
		${bus.busType}
		${bus.seatPrice}
		${bus.AC}
		${bus.arrival}
		${bus.destination}
		${bus.time}
	</c:forEach>
	
</body>
</html>