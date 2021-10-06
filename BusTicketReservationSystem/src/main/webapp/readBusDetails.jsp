<%@ page import=" java.util.ArrayList, java.util.Date" %>
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
<center><h2>Bus Details</h2>  </center>  
  <form action="viewBusDetailsServlet" method="POST">   
  <center>
 <input type="submit" value="View Details" id="butn1" name="view">     
 	</form>
 	<form action="updateBusDetailsServlet" method="POST">
  	<input type="submit" onclick="showForm(this.id)" name="select" value="Edit" id="butn2"> 
	</form>
	 <input type="button" value="Back" id="butn4">
   </center>   
 <div class="container">
  <table class="table table-striped" id="t1">
   
  <thead>
  <tr>
  	<th>Bus Number</th>
  	<th>Number of seats</th>
  	<th>Bus Type</th>
  	<th>Condition</th>
  	<th>Time</th>
  	<th>Arrival</th>
  	<th>Destination</th>
  	<th>Seat Price(Rs.)</th>
 
  </tr>
  </thead>
   
    
  <tbody>
   <c:forEach var="bus" items="${busDetails}">
   <%---- calling the get methods in bus.java----%> 
   
   <!--<c:set var="busNumber" value="${bus.busNumber}"/>
   <c:set var="noOfSeats" value="${bus.numberOfSeats}"/>
   <c:set var="busType" value="${bus.busType}"/>
   <c:set var="condition" value="${bus.AC}"/>
   <c:set var="time" value="${bus.uTime}"/>
   <c:set var="arrival" value="${bus.uArrival}"/>
   <c:set var="destination" value="${bus.uDestination}"/>
    <c:set var="price" value="${bus.price}"/>-->
   
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
  	<!--<c:url value="updateBusDetails.jsp" var="busupdate">
  	<c:param name="busNumber" value="${busNumber}"/>
  	<c:param name="seats" value="${noOfSeats}"/>
  	<c:param name="type" value="${busType}"/>
  	<c:param name="condition" value="${condition}"/>
  	<c:param name="time" value="${time}"/>
  	<c:param name="arr" value="${arrival}"/>
  	<c:param name="dest" value="${destination}"/>
  	<c:param name="price" value="${price}"/>
    </c:url>-->
  	
  	
  	
  	<%
  	ArrayList<String> buses = (ArrayList<String>)request.getAttribute("busNumbers");
  	%>
  	<% String status = (String)request.getAttribute("status");
		if(status == "1"){
			%>
  
	<form action="updateBusDetailsServlet" method="POST" id="f1">
  	 
  	 <select id="bus" name="bus">
  	 <%
  	 for(int i = 0; i < buses.size(); i++){
  	 %>
  	 	<option value="<%=buses.get(i) %>"><%=buses.get(i) %></option>
  	 <%
  	 }
  	 %>
  	 </select>
  	
  	 <input type="submit" name="selectt" value="Select" onclick="showForm(this.id)" id ="b3" >
  	
  	 </form>
  	 <%
		}
		%>
  	
  	 <form action="updateBusDetailsServlet" method="POST" id="f2">
  	<c:forEach var="bus" items="${BusDetails}"> 
  	<input type="hidden"  name="rId" value="${bus.id}">
  	<input type="hidden"  name="busNumber" value="${bus.busNumber}">
	Number of seats : <input type="text"  name="numberOfSeats" value="${bus.numberOfSeats}"><br>
	Bus Type : <input type="text"  name="busType" value="${bus.busType}"><br>
	Condition : <input type="text"  name="condition" value="<c:if test="${bus.AC == 1}">AC</c:if><c:if test="${bus.AC == 0}">NON-AC</c:if>" pattern="[0-1]" readonly><br>
	Time :  <input type="text"  name="time" value="${bus.uTime}"><br>
	Arrival :  <input type="text"  name="arra" value="${bus.uArrival}"><br>
	Destination :  <input type="text"  name="des" value="${bus.uDestination}"><br>
	Seat Price :  <input type="text"  name="price" value="${bus.price}"><br>
	  
	<input type="submit" value="Save" name="Save"  class="btn btn-primary">
    <input type="submit" value="Remove Bus" name="Remove Bus"  class="btn btn-danger"><br>
	  </c:forEach>
	 
	 
  	
     
	 
  	</form>
  	
  	
   
  

  
  
  		
	
	
  
  </div>
 

</body>
</html>