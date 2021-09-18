<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	<form action="findBus" method="post">
		<label>From: </label><br>
		<input type="text" name="arrival"><br>
		<label>To: </label><br>
		<input type="text" name="destination"><br>
		<label>Travel Date: </label><br>
		<input type="date" name="travelDate"><br>
		<input type="submit" name="submit" value="Find Bus">
	</form>
</body>
</html>