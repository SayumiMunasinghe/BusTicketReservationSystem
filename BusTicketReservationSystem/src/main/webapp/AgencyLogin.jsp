<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Agency Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  
	<style>
		.border {
			padding: 35px;
			border-radius: 25px;
			background-color: #f5f5f5;
		}
		  .navbar {
		    margin-bottom: 0;
		    background-color: #202020;
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
	</style>
  
</head>

<br><br><br><br><br>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-lg" style="padding-left: 5%; padding-right: 5%;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="homepage.jsp">Bus<span style="color: rgb(255, 115, 22);">hub</span> </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item"><a href="homepage.jsp">Go back</a></li>
      </ul>
    </div>
  </div>
</nav>

<body>
<br><br><br>
<div class="container">
<div class="border" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(247, 247, 247, 0.95) 0%), url(https://pngkey.com/png/full/8-80192_free-distinct-patterns-naldz-infinite-design-cube-black.png)">
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
 		<input type="text" name="password" placeholder ="Enter password" class="form-control" required>
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


</body>
</html>