<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>



<br><br><br><br><br>

<div class="container">
  <br>
  <div class="alert alert-success">
    
   
     <h1 style="text-align:center; font-size:60px;"><br><b>Registered Successfully!</b></h1>
        <br><br>
      <h3 style="text-align:center ; font-size:30px;">Redirrecting to Login in <span id="countdown">5</span></h3>
  
    <br><br>
    <br>
  </div>

</div>

<script>
var seconds = document.getElementById("countdown").textContent;
var countdown = setInterval(function() {
    seconds--;
    document.getElementById("countdown").textContent = seconds;
    if (seconds <= 0) clearInterval(countdown);
}, 1000);

 setTimeout(function(){
	            window.location.href = 'AgencyLogin.jsp';
	         }, 5000);
</script>



</body>
</html>