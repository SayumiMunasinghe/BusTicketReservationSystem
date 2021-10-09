<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta content="" name="description">
  <meta content="" name="keywords">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
<link href='https://fonts.googleapis.com/css?family=Manrope' rel='stylesheet'>

<title>Register</title>

<style>
   body, html{
				width: 100%;
				height: 100%;
				background-size:cover;
				font-family: 'Manrope', sans-serif;
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
	
	body{
			color:white;
	}
	
	.border{
	  		padding: 20px 35px 20px 35px;
	  		border-radius: 25px;
	 		background-color: #f5f5f5;
	 		width: 1000px;
	 		margin: auto;
	 		margin-top: 90px;
	}
	#poppy{
	  		border-radius: 25px;
	  		width: 1000px;
	 		margin: auto;
	}
		
	/* The message box is shown when the user clicks on the password field */
	#message {
	  display:none;
	  padding-left: 150px;
	}
	
	#msg{
		display: none;
		padding-left: 150px;
	}
	/* Add a green text color and a checkmark when the requirements are right */
	.valid {
		  color: green;
	}
	
	/*to make the password checking move to right*/
	p{
	padding-left: 35px;
	}
	
	
	.valid:before {
	  position: relative;
	  left: -35px;
	  content: "OK";
	}
	
	/* Add a red text color and an "x" when the requirements are wrong */
	.invalid {
	  color: red;
	}
	
	.invalid:before {
	  position: relative;
	  left: -35px;
	  content: "Invalid";
	}
	.coloring{
		color:#C3073F;
  	}
</style>

</head>
<body>

 <body style="background-image: url('webpage/home/assets/img/bg.jpg');">

<nav style="font-family: Life Savers;" class="navbar navbar-default navbar-fixed-top">

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


<script>
//front end validation to check if pwd == confirm pwd
     var check = function() {
        if (document.getElementById('pwd1').value != document.getElementById('pwd2').value) {
          document.getElementById('msg').style.color = 'red';
          document.getElementById('msg').innerHTML = 'Not Matching!';
          document.getElementById('msg').style.display = "block";
          document.getElementById("able").disabled = true;
          
        }else{
          document.getElementById('msg').style.display = "none";
          document.getElementById("able").disabled = false;
        }
}
</script>

<div class="container">
<div class="border" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(0, 0, 0, 0.9) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">
<h2>Passenger <span class="coloring">Registration</span></h2>
  <br>
  <form class="form-horizontal" action="PassengerInsertServlet"  method="post">
  
    <div class="form-group">
      <label  class="control-label col-sm-2" for="fname">First Name:</label>
       <div class="col-sm-10">
      <input type="text" class="form-control" id="fname" placeholder="Enter first name" name="fname" style=" border-radius:50px;" required>
    </div></div>
    
    <div class="form-group">
      <label  class="control-label col-sm-2" for="lname">Last Name:</label>
       <div class="col-sm-10">
      <input type="text" class="form-control" id="lname" placeholder="Enter last name" name="lname" style=" border-radius:50px;" required>
    </div></div>
    
    <div class="form-group">
      <label  class="control-label col-sm-2" for="email">Email:</label>
       <div class="col-sm-10">
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" style=" border-radius:50px;" required>
    </div></div>
    
    <div class="form-group">
      <label  class="control-label col-sm-2" for="pwd">Password:</label>
       <div class="col-sm-10">
      <input onkeyup='check();' type="password" class="form-control" id="pwd1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" style=" border-radius:50px;" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter password" name="pwd" required>
    </div></div>
      
    <div class="form-group">
      <label  class="control-label col-sm-2" for="pwd">Confirm Password:</label>
       <div class="col-sm-10">
      <input  onkeyup='check();' type="password" class="form-control" id="pwd2" placeholder="Re-enter password" name="repwd" style=" border-radius:50px;" required>
    </div>
   
     <div class="col-sm-10">     
	  	<div id="message">
			  <h3>Password must contain the following:</h3>
			  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
			  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
			  <p id="number" class="invalid">A <b>number</b></p>
			  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
		</div>
		<span id='msg'></span>
	</div>
	</div>
    
     <div class="form-group">
      <label  class="control-label col-sm-2" for="lname">Contact No:</label>
       <div class="col-sm-10">
      <input type="text" class="form-control" id="telno" placeholder="Enter phone number" pattern="[0]{1}[7]{1}[0-9]{8}" data-toggle="tooltip" title="Enter a 10 digit number" name="telno" style=" border-radius:50px;" required>
    </div></div>
 	
	<div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
    <input type="submit" class="btn btn-lg" value="Register" id="able" style="background-color: rgba(149, 7, 64, 0.87);">   
</div></div>
    
   
    
     <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
      	<div class="checkbox">
	
		  <label  class="form-check-label" for="flexCheckDefault"><input class="form-check-input" type="checkbox" value="" onclick="myFunction()" id="flexCheckDefault">Show Password</label>
    </div></div></div>
    
  </form>
</div>
</div>
<center>
	<p>Have an account ?<a style="color: #C3073F;" href="PassengerLogin.jsp"> Log In</a></p>
</center>
<% String msg = (String)request.getAttribute("msg");
		if(msg == "1"){
			%>
			<div class="" id = "poppy">
			  <div class="alert alert-success alert-dismissible fade in">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>You successfully registered!</strong> Redirecting....<span id="timer">5</span>
			  
			  </div>
			</div>
			<script>
				var seconds = document.getElementById("timer").textContent;
				var countdown = setInterval(function() {
					seconds--;
					document.getElementById("timer").textContent = seconds;
					if (seconds <= 0)
						clearInterval(countdown);
				}, 1000);
		
				setTimeout(function() {
					window.location.href = 'PassengerLogin.jsp';
				}, 5000);
			</script>
			<%
		}
		String nmsg = (String)request.getAttribute("nmsg");
		if(nmsg == "2"){%>
			<div class="" id = "poppy">
			    <div class="alert alert-danger alert-dismissible">
				    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				    <strong>Oops! </strong>Your account was not created.
		  		</div>
		    </div>
		<%}%> 
	
	<script>

		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();
		});

	
	//the below code shows the password to user
	function myFunction() {
	  var x = document.getElementById("pwd1");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}	
	
		var myInput = document.getElementById("pwd1");
		var letter = document.getElementById("letter");
		var capital = document.getElementById("capital");
		var number = document.getElementById("number");
		var length = document.getElementById("length");
		
		// When the user clicks on the password field, show the message box
		myInput.onfocus = function() {
		  document.getElementById("message").style.display = "block";
		}
		
		// When the user clicks outside of the password field, hide the message box
		myInput.onblur = function() {
		  document.getElementById("message").style.display = "none";
		}
		
		// When the user starts to type something inside the password field
		myInput.onkeyup = function() {
		  // Validate lowercase letters
		  var lowerCaseLetters = /[a-z]/g;
		  if(myInput.value.match(lowerCaseLetters)) {  
		    letter.classList.remove("invalid");
		    letter.classList.add("valid");
		  } else {
		    letter.classList.remove("valid");
		    letter.classList.add("invalid");
		  }
		  
		  // Validate capital letters
		  var upperCaseLetters = /[A-Z]/g;
		  if(myInput.value.match(upperCaseLetters)) {  
		    capital.classList.remove("invalid");
		    capital.classList.add("valid");
		  } else {
		    capital.classList.remove("valid");
		    capital.classList.add("invalid");
		  }
		
		  // Validate numbers
		  var numbers = /[0-9]/g;
		  if(myInput.value.match(numbers)) {  
		    number.classList.remove("invalid");
		    number.classList.add("valid");
		  } else {
		    number.classList.remove("valid");
		    number.classList.add("invalid");
		  }
		  
		  // Validate length
		  if(myInput.value.length >= 8) {
		    length.classList.remove("invalid");
		    length.classList.add("valid");
		  } else {
		    length.classList.remove("valid");
		    length.classList.add("invalid");
		  }
		}
	</script>
	
</body>
</html>