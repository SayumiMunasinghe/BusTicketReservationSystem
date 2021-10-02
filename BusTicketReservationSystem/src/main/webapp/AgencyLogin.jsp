<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Agency Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="webpage/assets/css/style.css" rel="stylesheet"> 
	<style>
		.border {
			padding: 35px;
			border-radius: 25px;
			background-color: #f5f5f5;
		}
		.navbar{
			position: relative;
			display: flex;
			flex-wrap:wrap;
			align-items: center;
			justify-content: space-between;
		}
	</style>
</head>

<br><br><br><br><br>

  <header id="header" class="header-top">
    <div class="container" >
      <h1><a href="index.html">OnlineBTRS</a></h1>

      <nav id="navbar" class="navbar" style="background-color:inherit">
        <ul style="background-color:inherit" >
          <li><a class="nav-link" href="TempHomepage.jsp">Home</a></li>
          <li><a class="nav-link" href="#about">About</a></li>
          <li><a class="nav-link" href="#resume">Register</a></li>
          <li><a class="nav-link active" href="#services">Login</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header>

<body>
<br><br><br>
<div class="container">
<div class="border" style="background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.95) 0%,rgba(0, 0, 0, 0.95) 0%), url(https://www.seekpng.com/png/full/46-463085_desktop-free-triangle.png
)">
  <h2>Agency Login</h2>
  <form class="form-horizontal" action="AgencyLoginServlet" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Agent Username:</label>
      <div class="col-sm-9">
        <input type="text" name="userName" placeholder="Enter username" class="form-control" required>
     </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">Agent password:</label>
      <div class="col-sm-9">
 		<input type="password" name="password" placeholder ="Enter password" class="form-control" required>
      </div>
      </div>
      
     <% String popup = (String)request.getAttribute("popup");
		if(popup == "1"){
			%><div class="" id = "popupp">
			  <div class="alert alert-danger alert-dismissible fade in">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>Username or Password is incorrect!</strong> Username or password does not match. Please enter valid details or register.
			  </div>
			</div><%
		}%>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" name="" value="Login"  class="btn btn-warning">

      </div>
    </div>
   
  </form>
  </div>
  <center> Not a member?<a href ="agencyRegistration.jsp"> Register now</a>
</div>
<script src="webpage/assets/js/main.js"></script>

</body>
</html>