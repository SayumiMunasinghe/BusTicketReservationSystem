<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OBTRS: Payment</title>
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
  	color: white;
  }
  .container h1{
	text-align: center;
	margin-bottom: revert;
	color: #C3073F;
  }
  .container .table{
  	font-family: HP Simplified;
  	width: 50%;
    max-width: 50%;
    margin-bottom: 20px;
    margin: auto;
    background-color: #1A1A1D;
  }
  .container .table td {
  	padding-left: 50px;
  	padding-right: 50px;
    border-block-color: inherit;
  }
  .alignText {
  	text-align: end;
  }
  .pay {
  	margin-top: 20px;
  	font-family: HP Simplified;
  	text-align: center;
  }
  .pay .btn {
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
<div class="container">
	<h1>BOOKING&nbsp&nbspSUMMARY</h1>
	<%
	     //if(session.getAttribute("userID") == null || session.getAttribute("mode") == null){ %>
		     <script>
				//window.location.href = 'PassengerLogin.jsp';
			</script>
	     <%//}
	%>
	<table class="table">
		<tr>
			<td>Bus ID</td>
			<td class="alignText">${busDetails.busID}</td>
		</tr>
		<tr>
			<td>Bus Number</td>
			<td class="alignText">${busDetails.busNumber}</td>
		</tr>
		<tr>
			<td>Bus Type</td>
			<td class="alignText">${busDetails.busType}</td>
		</tr>
		<tr>
			<td>Air Condition</td>
			<td class="alignText">${busDetails.AC}</td>
		</tr>
		<tr>
			<td>Starting Location</td>
			<td class="alignText">${busDetails.arrival}</td>
		</tr>
		<tr>
			<td>Ending Location</td>
			<td class="alignText">${busDetails.destination}</td>
		</tr>
		<tr>
			<td>Journey Date</td>
			<td class="alignText">${date}</td>
		</tr>
		<tr>
			<td>Journey Start Time</td>
			<td class="alignText">${busDetails.time}</td>
		</tr>
		<tr>
			<td>Price Per Seat</td>
			<td class="alignText">Rs. ${busDetails.seatPrice}0</td>
		</tr>
		<tr>
			<td>Number Of Seats Reserved</td>
			<td class="alignText">${seats}</td>
		</tr>
		<tr>
			<td>Total Price</td>
			<td class="alignText">Rs. ${price}0</td>
		</tr>
	</table>
	<div class="pay">
		<c:choose>
		    <c:when test="${cardNos == null}">
		        <a href="ManagePayment.jsp"><button>Add new card</button></a> 
		        <br />
		    </c:when>    
		    <c:otherwise>
		        <form action="PaymentServlet" method="post">
					<p>Select card to make payment: </p>
					<select id="card" name="card" style ="background-color: inherit ; color: white; border-radius: 4px; border-width:3px; border-radius: 4px; border-width:3px; border-color:#4E4E50;">
						<c:forEach var="c" items="${cardNos}">
							<option style="color: black;" value="${c}">${c}</option>
						</c:forEach>
					</select>
					<input class="btn" type="submit" name="paynow" value="Pay now">
				</form> 
				        <br />
		    </c:otherwise>
		</c:choose>
	</div>
</div>

</body>
</html>