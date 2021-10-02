<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Bus Details</title>

</head>
<body>
<h2>Bus Details</h2>  
  <form action="viewBusDetailsServlet" method="POST">    
 <input type="submit" value="View Bus Details" >
       
 <div class="container">
  <table class="table">
   
  <thead>
  <tr>
  	<th>Bus Number</th>
  	<th>Number of seats</th>
  	<th>Bus Type</th>
  	<th>Air Coonditioning</th>
  	<th>Time</th>
  	<th>Arrival</th>
  	<th>Destination</th>
  	<th>Seat Price</th>
  </tr>
  </thead>
   
    
  <tbody>
   <c:forEach var="bus" items="${busDetails}">
   <%---- calling the get methods in bus.java----%> 
  <tr>
  	<td>${bus.busNumber}</td>
  	<td>${bus.numberOfSeats}</td>
  	<td>${bus.busType}</td>
  	<td>
        <!-- to assign AC and NON-AC for values 1 and 0 stored in database -->
        <c:if test="${bus.AC == 1}">
        	AC
        </c:if>
        <c:if test="${bus.AC == 0}">
        	NON-AC
        </c:if>
    </td>
  	<td>${bus.uTime}</td>
  	<td>${bus.uArrival}</td>
  	<td>${bus.uDestination}</td>
  	<td>${bus.price}</td>
  </tr>
  </c:forEach>
  </tbody>		
	
	
  </table>
  </div>
</form> 
 

</body>
</html>