<%@ page import=" java.util.ArrayList, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style>
   body, html{
	width: 100%;
	height: 100%;
	background-size:cover;
	font-family: Life Savers;
}
  .navbar {
    margin-bottom: 0;
    background-color: transparent;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #white !important;
    background-color: #C3073F !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  
  .table{
 color: white;
  font-family:Verdana;
  
  

}
  .control-label{
  color: white;
 
  font-family:Verdana;
  }
  .form-control{
  color: white;
  font-family:Verdana;
  }
  .button {
	background-color:rgb(149, 7, 64);
	border: none;
	color: black;
	width: 90%;
	font-family:Verdana;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	
}
.button:hover {
	background-image: linear-gradient(to right, rgb(111, 34, 50), rgb(195,7,63));
	background-color:inherit;
	color: white;
	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
  input[type=text] {
  	font-family:Verdana;
  	background-color:transparent;
  	color:white;
  	border-bottom: 2px solid gray;
}
input[type=number] {
  	font-family:Verdana;
  	background-color:transparent;
  	color:white;
}
input[type=time] {
  	font-family:Verdana;
  	background-color:transparent;
  	color:white;
}
.myBody{
font-family:Verdana;

}
#minibutton1{
	background-color:#4E4E50;
	color:white;
}
#minibutton2{
	background-color:#C3073F;
}
#b3{
	background-color:rgba(149, 7, 64);
  color: white; 
  border: 2px solid rgb(0,0,0);
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  font-family:Verdana;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
</style>

<title>OBTRS: Manage Bus Details</title>

 
  

</head>

<%
	if(session.getAttribute("mode") == null || session.getAttribute("userID") == null){ %>
	     <script>
			window.location.href = 'AgencyLogin.jsp';
		</script>
     <%}
%>


<body style="background-image: url('webpage/home/assets/img/bg.jpg');" >

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-lg" style="padding-left: 5%; padding-right: 5%;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="homepage.jsp" style="font-size: 28px;">O<span style="color:#C3073F;">BTRS</span> </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul style="font-size: 18px;" class="nav navbar-nav navbar-right">
        <li class="nav-item"><a href="https://peterpanbus.com/company/our-story/">ABOUT</a></li>
        <li class="nav-item"><a href="https://peterpanbus.com/help/">CONTACT</a></li>
		        <% Integer loginStatus = (Integer)session.getAttribute("userID");
		           String loginMode = (String)session.getAttribute("mode");
				if(loginStatus == null || loginMode == null){ %> 
					 <li><a class="" type="button" data-toggle="dropdown">REGISTER</a>
			            <ul class="dropdown-menu" style="background-color: black;">
			              <li><a href="passengerinsert.jsp" >Register as Passenger</a></li>
			              <li><a href="agencyRegistration.jsp">Register as Agency</a></li>
			            </ul>
			          </li>
			          <li><a class="" type="button" data-toggle="dropdown">LOGIN</a>
			            <ul class="dropdown-menu" style="background-color: black;">
			              <li><a href="PassengerLogin.jsp" >Login as Passenger</a></li>
			              <li><a href="AgencyLogin.jsp">Login as Agency</a></li>
			            </ul>
			          </li>
				<% }else if (loginMode == "passenger"){ %>  
					<li><a class="" type="button" data-toggle="dropdown">MANAGE PASSENGER</a>
		            <ul class="dropdown-menu" style="background-color: black;">
		              <li><a href="ManagePassenger.jsp" >Manage Passenger Details</a></li>
		              <li><a href="ManagePayment.jsp">Manage Payment</a></li>
		              <li><a href="logout.jsp">Logout</a></li>
		            </ul>
				<% }else if (loginMode == "agency"){ %> 
				 <li><a class="" type="button" data-toggle="dropdown">MANAGE AGENCY</a>
	              <ul class="dropdown-menu" style="background-color: black;">
	              <li><a href="viewAgencyDetails.jsp">Manage Agency Details</a></li>
	              <li><a href="enterBusDetails.jsp">Add Bus Details</a></li>
	              <li><a href="readBusDetails.jsp">Manage Bus Details</a></li>
	              <li><a href="logout.jsp">Logout</a></li>
	            </ul>
				<% } else { 
					session.removeAttribute("userID");
					session.removeAttribute("mode");
				%> 
					 <script>
					  window.location.href = 'homepage.jsp';
					 </script> 
				<% } %>
      </ul>
    </div>
  </div>
</nav>
<script type="text/javascript">
<script type="text/javascript">
function showForm(clickedId){
if(clickedId == "butn1"){
	document.getElementById('myTable').style.display = "block";
	document.getElementById('t1').style.display = "block";
	document.getElementById('f1').style.display = "none";
    document.getElementById('f2').style.display = "none";
}else if(clickedId == "butn2"){
	document.getElementById('myTable').style.display = "none";
	document.getElementById('t1').style.display = "none";
	document.getElementById('f1').style.display = "none";
	
}}
</script>

  
<br><br><br><br>
<div class="myBody">
<center><h2 style="color: white;font-family:Verdana;">Bus Details</h2>  </center>  
  <form action="viewBusDetailsServlet" method="POST">   
  <center>
 <input type="submit" value="View Details" onclick="showForm(this.id)" id="butn1" class="button"name="view">     
 	</form><br>
 	<form action="updateBusDetailsServlet" method="POST">
  	<input type="submit"    name="select" onclick="showForm(this.id)" value="Edit" class="button" id="butn2"> 
	</form>
	<hr style="width: 90%;">
   </center>   
 <div class="container" >
 <% String stats = (String)request.getAttribute("stat");
		if(stats == "1"){
			%>
  <table class="table"  id="myTable" style="background-color:rgba(149, 7, 64, 0.0);" >
   
  <thead id="t1" > 
  <tr>
  	<th>Bus Number</th>
  	<th>Number of seats</th>
  	<th>Bus Type</th>
  	<th>Air-Condition</th>
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
  
  <script>
 
  </script>
  

  <%} %>
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
  	 <h3 style="color: white;font-family:Verdana;">Select the bus to be editted :</h3>
  	 <select id="bus" name="bus" style="background:transparent;border-bottom: 1px solid #C3073F !important; border:none;color:white;width:100px;">
  	 <%
  	 for(int i = 0; i < buses.size(); i++){
  	 %>
  	 	<option value="<%=buses.get(i) %>"><%=buses.get(i) %></option>
  	 <%
  	 }
  	 %>
  	 </select>
  	 <input type="submit" name="selectt" value="Select" onclick="showForm(this.id)" id ="b3" >
  	 
  	 
  	 <%
		}
		%>
  	
  	 <form action="updateBusDetailsServlet" method="POST" id="f2" style="vackground-color:black;">
  	<c:forEach var="bus" items="${BusDetails}" > 
  	<input type="hidden"  name="rId" value="${bus.id}">
  	<input type="hidden"  name="busNumber" value="${bus.busNumber}">
  	<div class="form-group">
  		<label class="control-label col-sm-2">Number of seats : </label>
  		<div class="col-sm-9">
  			<input type="text"  name="numberOfSeats" value="${bus.numberOfSeats}">
  		</div>
  	</div>
  	<div class="form-group">
  		<label class="control-label col-sm-2">Bus Type : </label>
  		<div class="col-sm-9">
  			<input type="text"  name="busType" value="${bus.busType}">
		</div>
	</div>
	<div class="form-group">
  		<label class="control-label col-sm-2">Air-Condition : </label>
  		<div class="col-sm-9">
  			<input type="text"  name="condition" value="<c:if test="${bus.AC == 1}">AC</c:if><c:if test="${bus.AC == 0}">NON-AC</c:if>" pattern="[0-1]" readonly>
		</div>
	</div>
	<div class="form-group">
  		<label class="control-label col-sm-2">Time :  </label>
  		<div class="col-sm-9">
  			<input type="time"  name="time" value="${bus.uTime}">
		</div>
	</div>
	<div class="form-group">
  		<label class="control-label col-sm-2">Arrival :</label>  
  		<div class="col-sm-9">
  			<input type="text"  name="arra" value="${bus.uArrival}">
		</div>
	</div>
	<div class="form-group">
  		<label class="control-label col-sm-2">Destination : </label> 
  		<div class="col-sm-9">
  			<input type="text"  name="des" value="${bus.uDestination}">
		</div>
	</div>
	<div class="form-group">
  		<label class="control-label col-sm-2">Seat Price : </label> 
  		<div class="col-sm-9">
  			<input type="number" min="0" max="1000" step="1"  name="price" value="${bus.price}">
	  	</div>
	  </div>
	<div class="form-group">
  		
  		<div class="col-sm-offset-2 col-sm-10">
  			<input type="submit" value="Save" name="Save" id="minibutton1" ><input type="submit" value="Remove Bus" name="Remove Bus"id="minibutton2" >
    	</div>
    
    </div>
	  </c:forEach>
	 
	 <br><br>
  	
     
	 
  	</form>
  	
  	
   
  

  
  
  		
	
	
  
  </div>
 
</div>
</body>
</html>