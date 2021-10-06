<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
	
	<style>
   body, html{
	width: 100%;
	height: 100%;
	background-size:cover;
	font-family: Life Savers;
   }
	 .middle {
	    display: flex;
	    width: 100%;
	    height: 70%;
	    align-items: center;
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
  </style>
</head>
<body style="background-image: url('webpage/home/assets/img/bg.jpg');">

	<br><br><br><br><br>

	<%
	if (request.getAttribute("updateSuccess") == "1") {
	%>  <div class ="middle">
		<div class="container">
				<br>
				<div class="alert alert-success">
					<h1 style="text-align: center; font-size: 60px;">
						<br>
						<b>Updated Data Successfully!</b>
					</h1>
					<br><br>
					<h3 style="text-align: center; font-size: 30px;"> Redirecting in... <span id="countdown">4</span></h3>
					<br>
					<br> <br>
				</div>
			</div>
		
			<script>
				var seconds = document.getElementById("countdown").textContent;
				var countdown = setInterval(function() {
					seconds--;
					document.getElementById("countdown").textContent = seconds;
					if (seconds <= 0)
						clearInterval(countdown);
				}, 1000);
		
				setTimeout(function() {
					window.location.href = 'homepage.jsp';
				}, 4000);
			</script>
		</div>
	<%
	} 
	else if(request.getAttribute("deleteSuccess") == "1"){
	%> <div class ="middle">
		<div class="container">
			<br>
			<div class="alert alert-success">
				<h1 style="text-align: center; font-size: 60px;">
					<br>
					<b>Account Removed Successfully!</b>
				</h1>
				<br>
				<br>
				<h3 style="text-align: center; font-size: 30px;">
					Redirecting in <span id="countdown">4</span>
				</h3>
	
				<br>
				<br> <br>
			</div>
	
		</div>
	
		<script>
			var seconds = document.getElementById("countdown").textContent;
			var countdown = setInterval(function() {
				seconds--;
				document.getElementById("countdown").textContent = seconds;
				if (seconds <= 0)
					clearInterval(countdown);
			}, 1000);
	
			setTimeout(function() {
				window.location.href = 'homepage.jsp';
			}, 4000);
		</script>
		</div>
	<%
	}
	else{
	%> <div class ="middle">
		<div class="container">
			<br>
			<div class="alert alert-success">
				<h1 style="text-align: center; font-size: 60px;">
					<br>
					<b>Registered Successfully!</b>
				</h1>
				<br><br>
				<h3 style="text-align: center; font-size: 30px;">
	
					<button onclick="loginNow()" class="btn btn-success btn-block">Login now</button>
					<button onclick="Homepage()" class="btn btn-success btn-block">Go to Home page</button>
				</h3>
	
				<br>
				<br> <br>
			</div>
		</div>
	
		<script>
			function loginNow() {
				window.location.href = 'AgencyLogin.jsp';
			} 
			function Homepage() {
				window.location.href = 'homepage.jsp';
			} 
				
			
		</script>
		</div>
	<%
	}
	%>


</body>
</html>