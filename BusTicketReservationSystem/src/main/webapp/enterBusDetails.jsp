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
<title>Insert title here</title>


</head>

<body>


<div class="container">  
  <form action="enterBusDetailsServlet" method="POST">
  <h2>Bus Registraion</h2>
	<div class="form-group">
		<label for="busNo">Bus No. : </label>
			<input type="text" class="form-control" id="number" name="number" required>
	</div>	
	
	<div class="form-group">
		<label for="seats">Number of seats : </label>
			<input type="text" class="form-control" id="no.ofseats" name="seat" pattern="[0-5][0-9]" required>
	</div>
		
	<div class="form-group">
		<label for="seats">Bus Type :</label>
			<input type="radio"  id="luxury" name="btype" value="LUXURY" checked>
  			<label for="luxury">LUXURY</label>
		
  			<input type="radio" id="semi-luxury" name="btype" value="SEMI-LUXURY">
  			<label for="semi-luxury">SEMI-LUXURY</label>
		
  			<input type="radio" id="blabla" name="btype" value="BLABLA">
  			<label for="superLuxury">SUPER LUXURY</label><br>	
	</div>
	
	<div class="form-group">
		<label for="condition"> Condition :</label>
		<input type="radio"  id="AC" name="ac/nonac" value=1 checked>
  		<label for="AC">AC</label>
  		<input type="radio"  id="NON-AC" name="ac/nonac" value=0>
  		<label for="NON-AC">NON-AC</label><br>
	</div>
	
	<p>Bus Route Details</p><br>
	Up-time :  <input type="time" id="utime" name="utime" required>
	Arrival : <input type="text" id="uarr" name="uarr" required>
  	Destination : <input type="text" id="udes" name="udes" required>
  	<br><br>

	Down-time :  <input type="time" id="dtime" name="dtime" required>
	
	Arrival : <input type="text" id="darr" name="darr" required>
  	Destination : <input type="text" id="ddes" name="ddes" required>
  	<br><br>
  	Seat Price : <input type="text" id="price" name="price" required><br><br><br><br>

  	<div class="form-group">
  	<input type="submit" value="Submit">
	</div>
</form>
</div>	
</body>
</html>