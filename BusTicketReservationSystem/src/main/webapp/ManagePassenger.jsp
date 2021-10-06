<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
 <meta content="" name="description">
  <meta content="" name="keywords">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="icon" href="https://upload.wikimedia.org/wikipedia/en/4/41/Victoria_bus_logo.svg">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
body, html{
	width: 100%;
	height: 100%;
	background-size:cover;
	color: white;
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
	
#form1{
	color: white;
}

#form2{
	color: white;
}

* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 20%;
  height: 350px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 2px solid #ccc;
  width: 50%;
  border-left: none;
  height: 350px;
  background-color: #f5f5f5;
	 		
}

.big{
	margin-left: 200px;
	margin-top: 100px;
}

.border{
	  	padding: 20px 35px 20px 35px;
	  	border-radius: 25px;
	 	background-color: #f5f5f5;
	 	width: 1000px;
	 	margin: auto;
}
.container{
		   width: auto;	
}

</style>

</head>
	
	<%
	if(session.getAttribute("mode") == null){ %>
	     <script>
			window.location.href = 'PassengerLogin.jsp';
		</script>
     <%}
%>

<body onload="mySubmit()">

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

  <form id="autosub" class="form-horizontal" action="ManagePassengerDetailsServlets" method="Post">
    	<input type="hidden" name="viewPassDetails" value="Manage Pass Details"> 
	</form>

<script>
	if(("${loadOne}" != "1"))
	function mySubmit() {
		 document.getElementById('autosub').submit();
	}
</script>

 <c:forEach var="pass" items = "${passDetails}">
<br><br>
<br><br>
<h4 style="margin-left: 200px;">Hi <strong>${pass.fName}</strong>,</h4>
<h2 style="margin-left: 200px; margin-bottom: -100px;">Settings</h2>
   </c:forEach>
<br>
<div class="big" style="">
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'Pwd')" id="defaultOpen">Password</button>
  <button class="tablinks" onclick="openCity(event, 'telno')">Contact Number</button>
  <button class="tablinks" onclick="openCity(event, 'delete')">Delete Account</button>
</div>


  <!-- this form is to update the password -->
<div id="Pwd" class="tabcontent" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(0, 0, 0, 0.9) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">

  <div class="container" id="form1">
  
  <h3>Password</h3>

  <form action="ManagePassengerDetailsServlets" method="post">
	<c:forEach var="pass" items = "${passDetails}">  
  <div class="form-group">

      <label for="pwd1">Password:</label>
      <input type="text" name="pwd" value="${pass.password}" style=" border-radius:50px;" class="form-control" id="pwd" onkeyup='check();' />
    </div>
    <div class="form-group">
      <label for="pwd2">Confirm Password:</label>
      <input type="text"  class="form-control" name="conpwd" id="conpwd" style=" border-radius:50px;" placeholder="Re-enter password" onkeyup='check();' /> 
  		<span id='message'></span>
    </div>

    <input type="submit" id="able" class="btn btn-success" name="updatePassword" value="Update">

  </c:forEach>
  </form>
</div>
</div>





<div id="telno" class="tabcontent" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(0, 0, 0, 0.9) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">

  <div class="container" id="form2">
  
  <h3>Contact Number</h3>
  <!-- this form is to update telephone number -->
  
  <form class="form-inline" action="ManagePassengerDetailsServlets" method="post">
  <c:forEach var="pass" items = "${passDetails}">
    <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" value="${pass.telno}" id="phone" name="phone" style=" border-radius:50px;">
    </div>
    

    <input type="submit" class="btn btn-success" name="updatePhone" value="Update">

    </c:forEach>
  </form>
  </div>
</div> 



<div class="container">
<div id="delete" class="tabcontent" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(0, 0, 0, 0.9) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">
  <h3>Delete My Account</h3>
   <div class="alert alert-danger">
    <strong>Warning!</strong> Once your account is delete this action cannot be reversed.
  </div>
  
   <form action="ManagePassengerDetailsServlets" method="post">
   		<input type="submit" class="btn btn-danger" name="delete" value="Delete My Account"> 
   </form> 

</div>

</div>
</div>

	  <% String popup = (String)request.getAttribute("msg");
		if(popup == "1"){
			%><div class="alert alert-warning alert-dismissible fade show">
    			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>

			    <strong>Warning!</strong> Your account was not deleted.

  			</div><%
		}%>

<script>
     var check = function() {
        if (document.getElementById('pwd').value != document.getElementById('conpwd').value) {
          document.getElementById('message').style.color = 'red';
          document.getElementById('message').innerHTML = 'Not Matching!';
          document.getElementById('message').style.display = "block";
          document.getElementById("able").disabled = true;
        }else{
          document.getElementById('message').style.display = "none";
          document.getElementById("able").disabled = false;
        }
	}

function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
   
</body>
</html> 
