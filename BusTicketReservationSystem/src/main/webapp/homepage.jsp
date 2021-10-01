<%@page import="com.btrs.homepage.BusDBUtil, java.time.LocalDate, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OBTRS: Home Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="https://upload.wikimedia.org/wikipedia/en/4/41/Victoria_bus_logo.svg">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
 <style>
  .jumbotron {
    background-color: #202020;
    color: #fff;
    padding: 100px 25px;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #202020;
    color: white;
  }
  .logo-small {
    color: #202020;
    font-size: 50px;
  }
  .logo {
    color: #202020;
    font-size: 200px;
  }

  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }

  .navbar {
    margin-bottom: 0;
    background-color: #202020;
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
    color: #202020 !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
  }
  ::-webkit-calendar-picker-indicator {
	    filter: invert(1);
	}
  </style>
</head>
<%
	LocalDate today = LocalDate.now();
	ArrayList<String> arrival = BusDBUtil.getArrival();
	ArrayList<String> destination = BusDBUtil.getDestination();
%>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-lg" style="padding-left: 5%; padding-right: 5%;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="homepage.jsp">O<span style="color: rgb(255, 115, 22);">BTRS</span> </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item" ><a href="https://peterpanbus.com/company/our-story/">ABOUT</a></li>
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
<div class="jumbotron texst-center" style="background-image: linear-gradient(to bottom, rgba(32, 32, 32, 1) 10%,rgba(32, 32, 32, 0.4) 100%), url(https://pngkey.com/png/full/8-80192_free-distinct-patterns-naldz-infinite-design-cube-black.png)">
  <div class="container">
    <br>
    <!-- <span style="color: rgb(255, 115, 22);">BTRS</span> -->
  <h1>Reserve your bus ticket now</h1> 
  <p style ="color:rgba(255, 255, 255, 0.507);">Fastest and easiest way to reserve your tickets online</p> 
	
	<form action="SelectBusServlet" method="POST">
	<div class="row" col-sm-15">
          <div class="col-sm-4">
            <label style ="color:rgba(255, 255, 255, 0.5);">FROM: </label>
          	<select id="arrival" name="arrival" class="form-control" style ="background-color: inherit ; color: white" required>
				<%
				for(int i = 0; i < arrival.size(); i++) {
				%>
					<option style="color: black" value="<%= arrival.get(i) %>"><%= arrival.get(i) %></option>
				<%
				}
				%>
				</select>
          </div>
          <div class="col-sm-4">
             <label style ="color:rgba(255, 255, 255, 0.5);">TO: </label>
             <select id="destination" name="destination" class="form-control" style ="background-color: inherit ; color: white" required>
				<%
				for(int i = 0; i < destination.size(); i++) {
				%>
					<option style="color: black" value="<%= destination.get(i) %>"><%= destination.get(i) %></option>
				<%
				}
				%>
			</select>
          </div>
          <div class="col-sm-4">
           <label style ="color:rgba(255, 255, 255, 0.5);">TRAVEL DATE: </label>
           <input type="date" name="travelDate" min="<%= today%>" required class="form-control" style ="background-color: inherit ; color: white">
          </div>
        </div>
        <br><br><br>
        <%  
	String flag = (String)request.getAttribute("flag");
	if(flag == "empty") {%>
		<div class="alert alert-danger">
		<p>No buses available for your chosen route. Please select different locations.</p>
		</div>
		</br></br>
	<%
	}
	String status = (String)request.getAttribute("status");
	if (status == "false") {
	%>
	<div class="alert alert-danger">
		<p>Something went wrong with your order. Please try again</p>
	</div>
	</br></br>
	<%	
	}
	String delete = (String)request.getAttribute("delete");
	if (delete == "done") {
	%>
	<div class="alert alert-info">
		<p>Your booking has been deleted. You will receive a refund within 2 working days.</p>
	</div><br><br>
	<%
	}
	String result = (String)request.getAttribute("result");
	if (delete == "fail") {
	%>
	<div class="alert alert-warning">
		<p>Your booking could not be updated.</p>
	</div></br></br>
	<%
	}
	String update = (String)request.getAttribute("update");
	if (update == "fail") {
	%>
	<div class="alert alert-info">
		<p>There are no other booking times available.</p>
	</div><br><br>
	<%
	}
%>
        <input type="submit" name="submit" value="Find Bus"  class="btn btn-warning btn-lg">
      </div><br>
	</form>
</div>

<!-- Container (Services Section) -->
<div class="container-fluid text-center">
  <h2><b>Why Book with O<span style="color: rgb(255, 115, 22);">BTRS</span>?</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <i class="bi bi-view-list" style="font-size: 10rem; color:#202020;"></i>
      <h4 style="color: rgb(255, 115, 22);"> <b>More Options</b></h4>
      <p>We give you maximum choices across  <br> all the routes to choose your bus along <br> with maximum flexibility.</p>
    </div>
    <div class="col-sm-4">
      <i class="bi bi-cash-coin" style="font-size: 10rem; color:#202020;"></i>
      <h4 style="color: rgb(255, 115, 22);" ><b>Best rates</b></h4>
      <p>We offer the best bus ticket prices <br> in the whole industry with addidional <br> discounts and offers</p>
    </div>
    <div class="col-sm-4">
      <i class="bi bi-hand-index-thumb" style="font-size: 10rem; color:#202020;"></i>
      <h4  style="color: rgb(255, 115, 22);"><b>Easy to use</b></h4>
      <p>Designed to be simple and easy<br> for anyone to use even without <br> much experience</p>
    </div>
  </div>
  <br><br>
  <div class="row">
    <div class="col-sm-4">
      <i class="bi bi-headset" style="font-size: 10rem; color:#202020;"></i>
      <h4  style="color: rgb(255, 115, 22);"><b>24/7 Customer support</b></h4>
      <p>We are always here to assist you <br> with any way we can. You can call <br> or text us anytime</p>
    </div>
    <div class="col-sm-4">
      <i class="bi bi-clock-history" style="font-size: 10rem; color:#202020;"></i>
      <h4  style="color: rgb(255, 115, 22);"><b>Saves time</b></h4>
      <p>Fast and quick ticket booking <br> with your phone or computer</p>
    </div>
    <div class="col-sm-4">
      <i class="bi bi-emoji-laughing" style="font-size: 10rem; color:#202020;"></i>
      <h4  style="color: rgb(255, 115, 22);"><b>Convenience</b></h4>
      <p>We will take care of all your <br> bus ticket reservation needs making <br> making it convinent for you.</p>
    </b>
    </div>
    
  </div>
  <br>
</div>

<!-- Container (Contact Section) -->
<div class="container-fluid bg-grey" style="background-image: linear-gradient(to bottom, rgba(32, 32, 32, 0.5) 0%,rgba(32, 32, 32, 0.5) 0%), url(https://pngkey.com/png/full/8-80192_free-distinct-patterns-naldz-infinite-design-cube-black.png)">
  <h2 class="text-center">CONTACT</h2>
  <div class="row" style="padding-left: 15%; padding-top: 50px; padding-bottom: 50px;">
    <div class="col-sm-4">
      <p><span class="glyphicon glyphicon-map-marker"></span> Colombo, Sri lanka.</p>
      <p><span class="glyphicon glyphicon-phone"></span>  +94 11 742 5484</p>
      <p><span class="glyphicon glyphicon-envelope"></span>  obtrs@Gmail.com</p>
    </div>
    <div class="col-sm-4">
      <p><span class=""></span> Terms and conditions</p>
      <p><span class=""></span> Privacy policy</p>
      <p><span class=""></span> Service updates dates</p>
    </div>
    <div class="col-sm-4">
      <p><span class=""></span> offers and special deals</p>
      <p><span class=""></span> Agents and more</p>
      <p><span class=""></span> Bus Operators and care providers</p>
    </div>    
  </div>
</div>

</body>
</html>
