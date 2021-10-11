<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Buses</title>
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/ab07e88f42.js" crossorigin="anonymous"></script>

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
  .my {
  	font-family: Bahnschrift;
  	border-style: solid;
	border-color: #950740;
	margin: auto;
	width: 65%;
  }
  .my .row {
  	padding: 10px;
  	color: white;
	margin: 10px;
	background-color: #1A1A1D;
	
  }
  .my div input{
  	border-radius: 4px;
  	background-color: #4E4E50;
  }
  .my div .submitBtn{
  	padding: 5px;
  	background-color: #C3073F;
  }
  .my div form {
  	margin: auto;
  	padding-top: 50px;
  	padding-bottom: 50px;
  }
</style>
</head>
<body style="background-image: url('webpage/home/assets/img/bg.jpg');">
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
<br><br><br><br>
<div class="my">
	<c:forEach var="bd" items="${busDetails}">
	<div class="row">
		<div class="col-sm-4">
			<p><i class="fas fa-bus" style="color:#C3073F"></i>&nbsp&nbspBus ID: ${bd.busID}</p>
			<p><i class="fas fa-bus-alt" style="color:#FFF8DC"></i>&nbsp&nbspBus Number: ${bd.busNumber}</p>
			<p><i class="fas fa-user-tie" style="color:#E0B0FF"></i>&nbsp&nbspNumber of Seats: ${bd.numberOfSeats}</p>
			<p><i class="fas fa-shuttle-van" style="color:#E97451"></i>&nbsp&nbspBus Type: ${bd.busType}</p>
			<p><i class="fas fa-dollar-sign" style="color:#00FF00"></i>&nbsp&nbspPrice per seat: ${bd.seatPrice}</p>
		</div>
		<div class="col-sm-4" style="padding-top: inherit;">
			<p><i class="fas fa-fan" style="color:#0096FF"></i>&nbsp&nbspAir Condition: ${bd.AC}</p>
			<p><i class="fas fa-map-marker-alt" style="color:#FF3131"></i>&nbsp&nbspStarting Location: ${bd.arrival}</p>
			<p><i class="fas fa-map-marker-alt" style="color:#DC143C"></i>&nbsp&nbspEnding Location: ${bd.destination}</p>
			<p><i class="fas fa-clock" style="color:#FFC000"></i>&nbsp&nbspTime of Journey: ${bd.time}</p>
		</div>
		<div class="col-sm-4">
			<form action="PaymentServlet" method="POST">
				<input type="hidden" name="busID" value="${bd.busID}">
				<input type="hidden" name="time" value="${bd.time}">
			
				Select number of seats to reserve: 
				<input type = "number" name="resSeat" min="1" max="${bd.remainingSeats}" required>
				<input class="submitBtn" type="submit" name="submit" value="Proceed to payment">
			</form>
		</div>
	</div>
	</c:forEach>
</div>
</body>
</html>