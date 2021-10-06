<%@page import="com.btrs.homepage.BusDBUtil, java.time.LocalDate, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OBTRS: Home Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<style>
   body, html{
	width: 100%;
	height: 100%;
	background-size:cover;
	font-family: Life Savers;
}
 
 
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
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
  }
  ::-webkit-calendar-picker-indicator {
	    filter: invert(1);
	}
	.alert-danger {
	    color: #a94442;
	    background-color: #f2dede;
	    border-color: #ebccd1;
	    width: 72.5%;
	    margin-left: 14px;
	    margin-top: 40px;
	    margin-bottom: 0px;
	}
  </style>
</head>

<body style="background-image: url('webpage/home/assets/img/bg.jpg');" onload="dropDowns()">

<form id = "auto" action="SelectBusServlet" method="POST">
	<input type="hidden" name="dropdowns" value="dropdowns">
</form>
<script>
	if("${x}" != "1") {
		function dropDowns() {
			document.getElementById('auto').submit();
		}
	}
</script>
<%
		LocalDate today = LocalDate.now();
		ArrayList<String> arrival = (ArrayList<String>)request.getAttribute("arrival");
		ArrayList<String> destination = (ArrayList<String>)request.getAttribute("destination");
%>
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
<div style="width: 100%; height: 100%; display:flex; align-items: center">
  <div class="container" style="border-left: 3px solid; border-image: linear-gradient(to right, #C3073F, #C3073F) 1; padding-left: 40px " >
    <br>
    <!-- <span style="color: rgb(255, 115, 22);">BTRS</span> -->
  <h1 style="color:white; font-size: 55px;">RESERVE YOUR <span style="color:#C3073F"> BUS TICKET </span> <br> NOW</h1> 
  <p style ="color:rgba(255, 255, 255, 0.507); font-size: 22px; color:#C3073F">WE&nbsp&nbspMADE&nbsp&nbspBOOKING&nbsp&nbspBUS&nbsp&nbspTICKETS&nbsp&nbspREVOLUTIONARY&nbsp&nbspEVERYONE</p> 
	<div class="row">
	<form action="SelectBusServlet" method="POST" style="font-family:sanserif;">
	<div>
          <div class="col-sm-3">
            <label style ="color:white;">FROM: </label>
          	<select id="arrival" name="arrival" class="form-control" style ="background-color: inherit ; color: white; border-radius: 4px; border-width:3px; border-radius: 4px; border-width:3px; border-color:#4E4E50;" required>
				<%
				if(request.getAttribute("x") == "1") {
				for(int i = 0; i < arrival.size(); i++) {
				%>
					<option style="color: black; " value="<%= arrival.get(i) %>"><%= arrival.get(i) %></option>
				<%
				}}
				%>
				</select>
          </div>
        </div>
          <div>
          <div class="col-sm-3">
          
             <label style ="color:white;">TO: </label>
             <select id="destination" name="destination" class="form-control" style ="background-color: inherit ; color: white; border-radius: 4px; border-width:3px; border-color:#4E4E50;" required>
				<%
				if(request.getAttribute("x") == "1") {
				for(int i = 0; i < destination.size(); i++) {
				%>
					<option style="color: black" value="<%= destination.get(i) %>"><%= destination.get(i) %></option>
				<%
				}}
				%>
			</select>
			
          </div>
          </div>
          
          <div>
          <div class="col-sm-3">
           <label style ="color:white;">TRAVEL DATE: </label>
           <input type="date" name="travelDate" min="<%= today%>" required class="form-control" style ="background-color: inherit ; color: white; border-radius: 4px; border-width:3px; border-radius: 4px; border-width:3px; border-color:#4E4E50;">
          </div>
        </div>
        
        <%  
    String flag = (String)session.getAttribute("flag");
	if(flag == "empty") {%>
	<br><br>
		<div class="alert alert-danger">
		<div class="row">
		  <div class="col-sm-10"><p style="margin: auto; padding-top: 3px;">No buses available for your chosen route. Please select different locations.</p></div>
		  <div class="col-sm-2"><button onclick="enable()">Cancel</button></div>
		</div>
		</div>
		
	<%
	}
	//String status = (String)request.getAttribute("status");
	if (flag == "false") {
	%><br><br>
	<div class="alert alert-danger">
		<div class="row">
		  <div class="col-sm-10"><p style="margin: auto; padding-top: 3px;">Something went wrong with your order. Please try again</p></div>
		  <div class="col-sm-2"><button onclick="enable()">Cancel</button></div>
		</div>
	</div>
	<%	
	}
	//String delete = (String)request.getAttribute("delete");
	if (flag == "done") {
	%><br><br>
	<div class="alert alert-danger">
		<div class="row">
		  <div class="col-sm-10"><p style="margin: auto; padding-top: 3px;">Your booking has been deleted. You will receive a refund within 2 working days.</p></div>
		  <div class="col-sm-2"><button onclick="enable()">Cancel</button></div>
		</div>
	</div>
	<%
	}
	//String result = (String)request.getAttribute("result");
	if (flag == "fail") {
	%><br><br>
	<div class="alert alert-danger">
		<div class="row">
		  <div class="col-sm-10"><p style="margin: auto; padding-top: 3px;">Your booking could not be updated.</p></div>
		  <div class="col-sm-2"><button onclick="enable()">Cancel</button></div>
		</div>
	</div>
	<%
	}
	//String update = (String)request.getAttribute("update");
	if (flag == "failure") {
	%><br><br>
	<div class="alert alert-danger">
		<div class="row">
		  <div class="col-sm-10"><p style="margin: auto; padding-top: 3px;">There are no other booking times available.</p></div>
		  <div class="col-sm-2"><button onclick="enable()">Cancel</button></div>
		</div>
	</div>
	<%
	}
%>
	</div>
        <input type="submit" id="submit" name="submit" value="FIND BUS"  class="btn btn-warning btn-lg" style="background-color:#C3073F; border-style:none; margin-top:20px;"><br><br><br>
      </div><br>
	</form>
	<script>
			function enable() {
				document.getElementById("submit").disabled = false;
				window.location.href = 'temp.jsp';
			}
	</script>
	<% if(flag!=null){ %>
	<script>
		document.getElementById("submit").disabled = true;
	</script>
	<%} %>
</div>
</body>
</html>
