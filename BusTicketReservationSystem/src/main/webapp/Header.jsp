<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Personal Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="webpage/home/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="webpage/home/assets/css/style.css" rel="stylesheet"> 
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header-top">
    <div class="container" >
      <h1><a href="index.html">OnlineBTRS</a></h1>
      <h2>We made booking <span>Bus Tickets </span> Revolutionary for Everyone</h2>
      <nav id="navbar" class="navbar" style="background-color:inherit">
        <ul style="background-color:inherit">
          <li><a class="nav-link active" href="homepage.jsp">Home</a></li>
          <li><a class="nav-link" href="#about">About</a></li>
                <% Integer loginStatus = (Integer)session.getAttribute("userID");
		            String loginMode = (String)session.getAttribute("mode");
			 	if(loginStatus == null || loginMode == null){ %> 
          <li><a class="nav-link" href="#register" onclick="autoRegister()">Register</a></li>
          <li><a class="nav-link" href="#login" onclick="autoLogin()">Login</a></li>
             	<% }else if (loginMode == "passenger"){ %>  
          <li><a class="nav-link" onclick="autoPassenger()">Manage Passenger</a></li>
                <% }else if (loginMode == "agency"){ %> 
          <li><a class="nav-link" onclick="autoAgency()">Manage Agency</a></li>
                <% } else { 
					session.removeAttribute("userID");
					session.removeAttribute("mode");
				 %> 
					 <script>
					  window.location.href = 'homepage.jsp';
					 </script> 
				 <% } %>
        </ul>
        <script>
          function autoAgency(){
        	  <% String button = "Agency";
        	     session.setAttribute("Agency", button);%>
        	     window.location.href = 'homepage.jsp';
          }
          
          function autoPassenger(){
        	  <% String button2 = "Passenger";
        	     session.setAttribute("Passenger", button2);%>
        	     window.location.href = 'homepage.jsp';
          }
          function autoLogin(){
        	  <% String button3 = "Login";
        	     session.setAttribute("Agency", button3);%>
        	     window.location.href = 'homepage.jsp';
          }
          
          function autoRegister(){
        	  <% String button4 = "Register";
        	     session.setAttribute("Passenger", button4);%>
        	     window.location.href = 'homepage.jsp';
          }
        </script>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header>

  

</body>
</html>

