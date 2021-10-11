<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, com.btrs.homepage.Order, com.btrs.homepage.BusTimes" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OBTRS: Update time</title>
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
  .container {
  	color: white;
  	font-family: Bahnschrift;
  	background-image: linear-gradient(#950740, #1A1A1D);
  	width: 300px;
    height: 400px;
    
  }
   .container .btn {
  	padding: 10 5px;
  	background-color: #C3073F;
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
<%
	ArrayList<BusTimes> bt = (ArrayList<BusTimes>)request.getAttribute("busTimes");
	if(bt.size() == 0 )
	{
		HttpSession session2 = request.getSession();
		String flag = "failure";
		session2.setAttribute("flag", flag);
		RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
		dis.forward(request, response);
	}
%>
<div class="container">
	<h1 style="font-family: Life Savers;padding-bottom: 50px; padding-top: 30px;">UPDATE</h1>
	<form action="" method="POST">
	<p>Current journey time: ${order.time}</p>
	<p>Choose time to update booking: </p>
		<input type="hidden" name="orderid" value="${order.orderID}">
		<select id="time" name="time" style ="background-color: #1A1A1D ; color: white; border-radius: 4px; border-width:3px; border-radius: 4px; border-width:3px; border-color:#4E4E50;">
	
		<c:forEach var="bt" items="${busTimes}">
			<option style="color:white;" value="${bt.time} ${bt.busid}">${bt.time}</option>
		</c:forEach>
		</select><br><br>
		<input class="btn" type="submit" name="updateTime" value="Update time">		
	</form><br>
	<p>If you do not wish to update booking time: </p>
	<button class="btn" onclick="history.go(-1)">Click here to go back</button>
</div>
</body>
</html>