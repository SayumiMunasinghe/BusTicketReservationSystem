<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Passenger Login</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

		<br><br><br><br><br><br>	
		<div class="container">
		<div class="well">
		<div class="border" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(247, 247, 247, 0.95) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">
	  <h2>Passenger Login</h2>
	  <form action="PassengerLoginServlet" method="post">
	 
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
	    </div>
	  
	    <div class="form-group">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pw" required>
	    </div>
	  	
	  	<div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" onclick="myFunction()" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">Show Password</label>
	  	  </div>
	    
	    <input type="submit" class="btn btn-default" value="Login">
	  </form>
	  </div>
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