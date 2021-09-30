<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Details</title>

</head>
<body>


  <h2>Buses</h2>            
  <table class="table table-striped">
   <c:forEach var="bus" items="${busDetails}">
   <%---- calling the get methods in bus.java----%>
     
     <%-------assigning values of in the form into a set-------%>
     <c:set var="bnumber" value="${bus.busNumber}"/>
     <c:set var="no.ofseats" value="${bus.numberOfSeats}"/>
     <c:set var="type" value="${bus.busType}"/>
     <c:set var="condition" value="${bus.AC}"/>
     
      <tr>
      	<th>Bus Number</th>
      	<td>${bus.busNumber}</td>
      </tr>
     
      <tr>
        <th>Number of seats</th>
        <td>${bus.numberOfSeats}</td>
       </tr>
      
       <tr>
        <th>Bus Type</th>
        <td>${bus.busType}</td>
       </tr>
      
       <tr>
        <th>Air Coonditioning</th>
        <td>${bus.AC}</td>
      </tr>	
			
	</c:forEach>
  </table>
  
  	<%-----url of the page to be navigated to --%>
  	<c:url value="updateBusDetails.jsp" var="busUpdate">
  		<%----values to be taken to that navigated page --%>
  		<c:param name="busNumber" value="${bnumber}"/>
  		<c:param name="numberOfSeats" value="${no.ofseats}"/>
  		<c:param name="busType" value="${btype}"/>
  		<c:param name="condition" value="${condition}"/>
  	</c:url>
	
	<a href="${busUpdate}">
	<input type="button" name="update" value="Update bus Details">
	</a>
	
</body>
</html>