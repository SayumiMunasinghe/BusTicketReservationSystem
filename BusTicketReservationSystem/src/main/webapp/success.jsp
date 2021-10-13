<!DOCTYPE html>
<html lang="en">
<head>
  
  <title>OBTRS:BUS Success Page</title>
  <meta charset="utf-8">
  <link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .jumbotron {
    background-color: #000000;
    color: #fff;
  }
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
  
  </style>
</head>
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
<br><br><br><br>
<div class="jumbotron text-center">
  <h1 style="font-family:Verdana;">Action Completed Successfully!!!</h1> 
  
</div>
<!-- buttonsss -->
<h3 style="text-align: center; font-size: 30px;">
	
					<button onclick="AddBus()" class="button">Add Bus</button>
					<button onclick="manageBus()" class="button">Manage Bus</button>
					<button onclick="Homepage()" class="button">Home page</button>
				</h3>
	
<script>
			function AddBus() {
				window.location.href = 'enterBusDetails.jsp';
			} 
			function manageBus() {
				window.location.href = 'readBusDetails.jsp';
			} 
			function Homepage() {
				window.location.href = 'homepage.jsp';
			} 
				
			
		</script>
</body>
</html>