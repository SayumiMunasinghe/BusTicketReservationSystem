<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <title>Agency Login</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="webpage/Agencyform/css/main.css" rel="stylesheet" media="all">
<style>
   body, html{
	width: 100%;
	height: 100%;
	background-size: cover;
	font-family: Life Savers;
	background-repeat: no-repeat;
	background-attachment: fixed;
}
  .card-heading {background: url("webpage/Agencyform/images/bg4.jpg") top left/cover no-repeat;}

 .border {
			padding: 35px;
			border-radius: 25px;
			background-color: #f5f5f5;
        }
 .middle{   display:flex;
			width:100%;
			height:100%;
			align-items:center;
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
  
  .input--style-3{
  padding: 0px;
  color: #950740;
  }

	.card-3{
	background-color:inherit;
	}
	
	.p-b-100 {
    padding-bottom: auto;
	}
	.p-t-180 {
	    padding-top: 80px;
	}
	.wrapper--w780{
	max-width: 1100px;
	}
	input {
    width: 380px;
    }

	
	/* The message box is shown when the user clicks on the password field */
#message {
	display: none;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
	color: green;
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
	color: red;
}
  </style>
</head>

 <body style="background-image: url('webpage/home/assets/img/bg.jpg'); background-size: cover;">


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
  
   <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins" >
        <div class="wrapper wrapper--w780">
            <div class="card card-3" >
                  
             <!--    <div class="card-body" style="border-style: solid; border-color:#C3073F; border-radius:0px 10px 10px 0px;  border-left: black; border-width: 2px">   --> 
               <div class="card-body" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(80, 10, 10, 0.4));">  
                    <h2 class="title">Agency Login</h2>
                   <form class="form-horizontal" action="AgencyRegistrationServlet" method="post">
                        <div class="input-group">
                             <input type="text" name="agentNIC" placeholder="Enter your NIC" class="input--style-3" required>
                        </div>
                        <div class="input-group">
                            <input type="text" name="companyName" placeholder="Enter your company name" class="input--style-3" required>
                        </div>
                         <div class="input-group">
                             <input type="text" name="agentPhone" placeholder="Enter Your mobile phone" class="input--style-3" required>
                        </div>
                        <div class="input-group">
                            <input type="email" name="agentEmail" placeholder="Enter your email" class="input--style-3" required>
                        </div>
                         <div class="input-group">
                             <input type="text" name="agencyLocation" placeholder="Enter agency location" class="input--style-3" required>
                        </div>
                        <div class="input-group">
                         <input type="password" id="psw" name="password"
							class="input--style-3"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onkeyup="passMatch2()" placeholder="Password"  required>
                        </div>
                        
                        <div id="message" style="display: none">
						<h3>Password must contain the following:</h3>
						<p id="letter" class="invalid">
							A <b>lowercase</b> letter
						</p>
						<p id="capital" class="invalid">
							A <b>capital (uppercase)</b> letter
						</p>
						<p id="number" class="invalid">
							A <b>number</b>
						</p>
						<p id="length" class="invalid">
							Minimum <b>8 characters</b>
						</p>
			     		</div>
                        
                        <div class="input-group">
                            <input type="password" name="confirmPassword" id="cpws" class="input--style-3"  placeholder="Confirm Password" onfocusout="passMatch()" required>
                        </div>
                        <div class="input-group">
                            <input type="text" name="userName" placeholder="Enter username" class="input--style-3" required>
                        </div>
                                            
                   				<% String popup = (String)request.getAttribute("popup");
							if(popup == "1"){
								%><div class="" id="popupp">
										<div class="alert alert-danger alert-dismissible fade in">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											<strong>Username Exists!</strong> Username already exists. Please
											enter a different username or login.
										</div>
									</div>
									<%
							}else if(popup == "2"){
								%><div class="" id="popupp">
										<div class="alert alert-danger alert-dismissible fade in">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											<strong>Email Already Exists!</strong> Email already exists.
											Please enter a different email or login.
										</div>
									</div>
									<%
							}%>
                        
                        <div class="p-t-10">
                            <button class="btn btn--pill" style="background-color:rgba(149, 7, 64, 0.87)" id="regButt" type="submit">REGISTER</button>
                        </div>
                    </form>
                    
                </div>
                 <div class="card-heading">
                 
                 
                 </div>
            </div>
             
        </div>
        <center style="color: #a6a6a6"> Already registered?<a href ="AgencyLogin.jsp" style="color: #950740">Login now</a>
    </div>

<script type="text/javascript">

	    function passMatch(){
	    	var password = document.getElementById("psw").value;
	        var confirmPassword = document.getElementById("cpws").value;
	        if (password != confirmPassword) {
	        	document.getElementById("regButt").disabled = true;
	            alert("Passwords do not match.");
	            return false;
	        }else if (password == confirmPassword){
	        	document.getElementById("regButt").disabled = false;
	        }
	    }
	    
	    function passMatch2(){
	    	var password = document.getElementById("psw").value;
	        var confirmPassword = document.getElementById("cpws").value;
	    	if (password == confirmPassword){
	        	document.getElementById("regButt").disabled = false;
	        } else if (password != confirmPassword){
	        	document.getElementById("regButt").disabled = true;
	        }
	    }
	    
	    
	    
	    var myInput = document.getElementById("psw");
	    var letter = document.getElementById("letter");
	    var capital = document.getElementById("capital");
	    var number = document.getElementById("number");
	    var length = document.getElementById("length");

	    myInput.onfocus = function() {
	      document.getElementById("message").style.display = "block";
	    }

	    myInput.onblur = function() {
	      document.getElementById("message").style.display = "none";
	    }
	    
	    myInput.onkeyup = function() {
	      var lowerCaseLetters = /[a-z]/g;
	      if(myInput.value.match(lowerCaseLetters)) {  
	        letter.classList.remove("invalid");
	        letter.classList.add("valid");
	      } else {
	        letter.classList.remove("valid");
	        letter.classList.add("invalid");
	      }
	      
	      var upperCaseLetters = /[A-Z]/g;
	      if(myInput.value.match(upperCaseLetters)) {  
	        capital.classList.remove("invalid");
	        capital.classList.add("valid");
	      } else {
	        capital.classList.remove("valid");
	        capital.classList.add("invalid");
	      }

	      var numbers = /[0-9]/g;
	      if(myInput.value.match(numbers)) {  
	        number.classList.remove("invalid");
	        number.classList.add("valid");
	      } else {
	        number.classList.remove("valid");
	        number.classList.add("invalid");
	      }
	      
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