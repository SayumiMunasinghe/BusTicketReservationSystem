<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Passenger Login</title>
<meta charset="utf-8">
  <meta content="" name="description">
  <meta content="" name="keywords">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="icon" href="https://upload.wikimedia.org/wikipedia/en/4/41/Victoria_bus_logo.svg">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">  

</head>

<style>
		body{
			color:white;
		}
		body, html{
					width: 100%;
					height: 100%;
					background-size:cover;
   		}
	
	.border{
	  		padding: 20px 35px 20px 35px;
	  		border-radius: 25px;
	 		background-color: #f5f5f5;
	 		width: 1000px;
	 		margin: auto;
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

<body>

 <body style="background-image: url('webpage/home/assets/img/bg.jpg');">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-lg" style="padding-left: 5%; padding-right: 5%;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="homepage.jsp">O<span style="color:#d19300;">BTRS</span> </a>
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

		<br><br><br><br><br><br>	
		<div class="container">
		
		<div class="border"  style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(0, 0, 0, 0.9) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">
	  <h2>Passenger Login</h2>
	  <form action="PassengerLoginServlet" method="post">
	 
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" style=" border-radius:50px;" required>
	    </div>
	  
	    <div class="form-group">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="pwd" placeholder="Enter password" style=" border-radius:50px;" name="pw" required>
	    </div>
	  	
	  	<div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" onclick="myFunction()" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">Show Password</label>
	  	  </div>
	    
	    <input type="submit" class="btn btn-success btn-lg" value="Login">
	  </form>
	  </div>
	  
	</div>
	
<script>
//the below code shows the password to user
		function myFunction() {
		  var x = document.getElementById("pwd");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
</script>

</body>
</html>