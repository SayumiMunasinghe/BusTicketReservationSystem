<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Passenger Registration</title>
</head>
<body>

<script>
	
	
	
	
</script>

	<div class="container">
  <h2>Passenger Registration</h2>
  <br>
  <form action="PassengerInsertServlet" method="post">
  
    <div class="form-group">
      <label for="fname">First Name:</label>
      <input type="text" class="form-control" id="fname" placeholder="Enter first name" name="fname" required>
    </div>
    <div class="form-group">
      <label for="lname">Last Name:</label>
      <input type="text" class="form-control" id="lname" placeholder="Enter last name" name="lname" required>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd1" placeholder="Enter password" name="pwd" required>
    </div>
    <div class="form-group">
      <label for="pwd">Re-Enter Password:</label>
      <input type="password" class="form-control" id="pwd2" placeholder="Re-enter password" name="repwd" required>
    </div>
    <h6 id="mismatch"></h6>
     <div class="form-group">
      <label for="lname">Contact No:</label>
      <input type="text" class="form-control" id="telno" placeholder="Enter phone number" name="telno" required>
    </div>
 
    <input type="submit" class="btn btn-default" value="Register">
  </form>
</div>
	
	
</body>
</html>