<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
 <meta name="viewport" content="width=device-width, initial-scale=1">
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

  .control-label{
  color: white;
 
  font-family:Verdana;
  }
  .form-control{
  color: white;
  font-family:Verdana;
  }
  #price,#utime,#dtime{
  font-family:Verdana;
  }
  .seat{
  font-family:Verdana;
  }
  
  input[type=text] {
  	outline: none; 
	border: none;
	border-bottom: 2px solid gray; 
	background:transparent;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	outline: none;
}
.button {
  background-color:rgba(149, 7, 64, 0.0);
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


.button:hover {
background-color:black; 
  color: white;
  
}
	</style>
	<title>OBTRS:Bus Registration</title>


</head>
<%
	if(session.getAttribute("mode") == null || session.getAttribute("userID") == null){ %>
	     <script>
			window.location.href = 'AgencyLogin.jsp';
		</script>
     <%}
%>


	<body font-color="white"; style="background-image: url('webpage/home/assets/img/bg.jpg');">
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
  

<br><br>
<div class="container">  
  <form style="background-color:rgba(149, 7, 64, 0.5)"class="form-horizontal" action="enterBusDetailsServlet" method="POST">
  <h2 class="control-label" style="text-align:center;">Bus Registration</h2>
	<div class="form-group">
		<label for="busNo" class="control-label col-sm-2">Bus No. : </label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="number" name="number" required>
		</div>
	</div>	
	
	<div class="form-group">
		<label for="seats" class="control-label col-sm-2">Number of seats : </label>
		&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" class="seat" id="no.ofseats" name="seat" min="20" max="100" step="1"style="width:150px;background:transparent;border-bottom: 2px solid gray !important; border:none;" required>
	</div>
		
	<div class="form-group">
		<label for="seats" class="control-label col-sm-2">Bus Type :</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio"  id="luxury" name="btype" value="Luxury" checked>
  			<label for="luxury" class="control-label">Luxury</label>
		
  			<input type="radio" id="semi-luxury" name="btype" value="Semi Luxury">
  			<label for="semi-luxury" class="control-label">Semi Luxury</label>
		
  			<input type="radio" id="super-luxury" name="btype" value="Super Luxury">
  			<label for="superLuxury" class="control-label">Super Luxury</label>	
	</div>
	
	<div class="form-group">
		<label for="condition" class="control-label col-sm-2"> Condition :</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio"  id="AC" name="ac/nonac" value=1 checked>
  		<label for="AC" class="control-label">AC</label>
  		<input type="radio"  id="NON-AC" name="ac/nonac" value=0>
  		<label for="NON-AC" class="control-label">NON-AC</label>
	</div>
	
	<h3 class="control-label" style="text-align:center;">Bus Route Details</h3>
	
	<div class="form-group">
	<label for="uptime" class="control-label col-sm-2">Up-time :</label> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="time" id="utime" name="utime" style="width:150px;background:transparent;border-bottom: 2px solid gray !important; border:none;" required>
	</div>
	<div class="form-group">
		<label for="upArrival" class="control-label col-sm-2">Arrival : </label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="uarr" name="uarr" required>
		</div>
	</div>
	<div class="form-group">
  		<label for="upDestination" class="control-label col-sm-2">Destination :</label> 
  		<div class="col-sm-9">
  			<input type="text" class="form-control" id="udes" name="udes" required>
  		</div>
  	</div>
  	<br>
	<div class="form-group">
	<label for="downtime" class="control-label col-sm-2">Down-time :</label> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="time" id="dtime" name="dtime" style="width:150px;background:transparent;border-bottom: 2px solid gray !important; border:none;" required>
	</div>
	<div class="form-group">
		<label for="downArrival" class="control-label col-sm-2">Arrival :</label> 
		<div class="col-sm-9">
			<input type="text" class="form-control" id="darr" name="darr" required>
		</div>
	</div>
	
	<div class="form-group">
  		<label for="downDestination" class="control-label col-sm-2">Destination :</label> 
  		<div class="col-sm-9">
  			<input type="text" class="form-control" id="ddes" name="ddes" required>
  		</div>
  	</div>
  	
  	<div class="form-group">
  	<label for="seatPrice" class="control-label col-sm-2">Seat Price (Rs.):</label> 
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"  id="price" name="price" min="0" max="1000" step="1" style="width:150px;background:transparent;border-bottom: 2px solid gray !important; border:none;" required>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
 		<input class="button" type="submit" value="Submit" ><button onclick="Homepage()" class="button">Back</button>
	</div>
	</div>
	
	<script type="text/javascript">
	function Homepage() {
		window.location.href = 'homepage.jsp';
	} 
	
	</script>
	<br>
	
</form>

</div>	
</body>
</html>