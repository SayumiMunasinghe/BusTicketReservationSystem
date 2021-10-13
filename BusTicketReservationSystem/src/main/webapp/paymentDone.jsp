<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.btrs.homepage.Order" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OBTRS: Payment Successful</title>
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
  .container {
    width: fit-content;
  	color: white;
  	background-image: linear-gradient(#950740, #1A1A1D);
  	padding-bottom: 10px;
  }
  .container p {
  	font-family: Bahnschrift;
  }
         
   .btn {background-image: linear-gradient(to right, #000000 0%, #434343  51%, #000000  100%)}
   .btn{
       padding: 15px 5x;
	    text-align: center;
	    text-transform: uppercase;
	    transition: 0.5s;
	    background-size: 200% auto;
	    color: white;
	    border-radius: 4px;
	    display: block;
    }

    .btn:hover {
      background-position: right center; /* change the direction of the change here */
      color: #fff;
      text-decoration: none;
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

	<c:if test="${delete == 'fail'}">
		<p>Your booking could not be deleted. Please try again</p>
	</c:if>	
	<div class="container">
		<h1 style="font-weight: 1000;">PAYMENT SUCCESSFUL !</h1><br>
		<div>
		
			<h1 style="font-family: Life Savers;padding-bottom: 20px;text-align: center;">BOOKING SUMMARY</h1>
			<p>Ticket ID: ${order.orderID}</p>
			<p>Bus ID: ${order.busID}</p>
			<p>Date of journey: ${order.date}</p>
			<p>Time of Journey: ${order.time}</p>
			<p>Number of seats reserved: ${order.reservedSeats}</p>
			
			<a href="homepage.jsp"><button class="btn" style="margin-top: 10px;">Back to homepage</button></a>
		</div>
		<br>
		<p>If you delete your booking, you will receive a 50% refund</p>
		<form action="OrderManagementServlet" method="POST">
			<input type="hidden" name="orderid" value="${order.orderID}">
			<input class="btn" type="submit" value="Delete Booking" name="delete"> 
		</form><br>
		<p>You can choose to update your booking time. You will be redirected to the homepage if there are no other possible booking times.</p>
		<form action="OrderManagementServlet" method="POST">
			<input type="hidden" name="orderid" value="${order.orderID}">
			<input class="btn" type="submit" value="Update Booking" name="update">
		</form>
	</div>
</body>
</html>