<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
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
  .formtexts{
  color: white;
  }
	</style>
	<title>Insert title here</title>


</head>
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
  

<br><br><br>
<div class="container">  
  <form action="enterBusDetailsServlet" method="POST">
  <h2 class="formtexts">Bus Registraion</h2>
	<div class="form-group">
		<label for="busNo" class="formtexts">Bus No. : </label>
			<input type="text" class="form-control" id="number" name="number" required>
	</div>	
	
	<div class="form-group">
		<label for="seats" class="formtexts">Number of seats : </label>
			<input type="text" class="form-control" id="no.ofseats" name="seat" pattern="[0-5][0-9]" required>
	</div>
		
	<div class="form-group">
		<label for="seats" class="formtexts">Bus Type :</label>
			<input type="radio"  id="luxury" name="btype" value="LUXURY" checked>
  			<label for="luxury" class="formtexts">LUXURY</label>
		
  			<input type="radio" id="semi-luxury" name="btype" value="SEMI-LUXURY">
  			<label for="semi-luxury" class="formtexts">SEMI-LUXURY</label>
		
  			<input type="radio" id="blabla" name="btype" value="BLABLA">
  			<label for="superLuxury" class="formtexts">SUPER LUXURY</label><br>	
	</div>
	
	<div class="form-group">
		<label for="condition" class="formtexts"> Condition :</label>
		<input type="radio"  id="AC" name="ac/nonac" value=1 checked>
  		<label for="AC" class="formtexts">AC</label>
  		<input type="radio"  id="NON-AC" name="ac/nonac" value=0>
  		<label for="NON-AC" class="formtexts">NON-AC</label><br>
	</div>
	
	<h3 class="formtexts">Bus Route Details</h3><br>
	
	<label for="uptime" class="formtexts">Up-time : </label> <input type="time" id="utime" name="utime" required><br>
	
	<div class="form-group">
		<label for="upArrival" class="formtexts">Arrival : </label>
			<input type="text" class="form-control" id="uarr" name="uarr" required>
	</div>
	<div class="form-group">
  		<label for="upDestination" class="formtexts">Destination :</label> 
  			<input type="text" class="form-control" id="udes" name="udes" required>
  	</div>
  	<br><br>

	<label for="downtime" class="formtexts">Down-time : </label> <input type="time" id="dtime" name="dtime" required>
	
	<div class="form-group">
		<label for="downArrival" class="formtexts">Arrival :</label> 
			<input type="text" class="form-control" id="darr" name="darr" required>
	</div>
	
	<div class="form-group">
  		<label for="downDestination" class="formtexts">Destination :</label> 
  			<input type="text" class="form-control" id="ddes" name="ddes" required>
  	</div>
  	
  	<br><br>
  	<label for="seatPrice" class="formtexts">Seat Price :</label> 
  		<input type="text" class="form-control" id="price" name="price" required><br><br><br><br>

  	<div class="form-group">
  		<input type="submit" value="Submit">
	</div>
</form>
</div>	
</body>
</html>