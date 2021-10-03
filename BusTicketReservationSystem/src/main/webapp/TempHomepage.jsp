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
  <link href="webpage/home/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="webpage/home/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="webpage/home/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="webpage/home/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="webpage/home/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> 
  <link href="webpage/home/assets/css/style.css" rel="stylesheet"> 
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container">

      <h1><a href="index.html">OnlineBTRS</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
      <h2>We made booking <span>Bus Tickets </span> Revolutionary for Everyone</h2>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link active" href="#header">Home</a></li>
          <li><a class="nav-link" href="#about">About</a></li>
                <% Integer loginStatus = (Integer)session.getAttribute("userID");
		            String loginMode = (String)session.getAttribute("mode");
			 	if(loginStatus == null || loginMode == null){ %> 
          <li><a class="nav-link" href="#register">Register</a></li>
          <li><a class="nav-link" href="#login">Login</a></li>
             	<% }else if (loginMode == "passenger"){ %>  
          <li><a class="nav-link" href="#passengerManage">Manage Passenger</a></li>
          <li><a class="nav-link" href="logout.jsp">Logout</a></li>
                <% }else if (loginMode == "agency"){ %> 
          <li><a class="nav-link" href="#agencyManage">Manage Agency</a></li>
          <li><a class="nav-link" href="logout.jsp">Logout</a></li>
                <% } else { 
					session.removeAttribute("userID");
					session.removeAttribute("mode");
				 %> 
					 <script>
					  window.location.href = 'TempHomepage.jsp';
					 </script> 
				 <% } %>
		   
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      
    
        	  <% if(session.getAttribute("Agency") == "Agency"){
        		  %><a href="#agencyManage" id="butt"> </a><% 
        		  session.removeAttribute("Agency");%>
        		  <script>document.getElementById('butt').click();</script><% 
        	    }else if(session.getAttribute("Passenger") == "Passenger"){
          		  %><a href="#agencyManage" id="butt2"> </a><% 
                		  session.removeAttribute("Passenger");%>
                		  <script>document.getElementById('butt2').click();</script><% 
                 }else if(session.getAttribute("Register") == "Register"){
             		  %><a href="#agencyManage" id="butt3"> </a><% 
                    		  session.removeAttribute("Register");%>
                    		  <script>document.getElementById('butt3').click();</script><% 
                 }else if(session.getAttribute("Login") == "Login"){
             		  %><a href="#agencyManage" id="butt4"> </a><% 
                    		  session.removeAttribute("Login");%>
                    		  <script>document.getElementById('butt4').click();</script><% 
                 }
        	    %>

     

      <div class="social-links">
        <form>
          <div class="form-group" >
  
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"  style=" border-radius:50px; background-color:inherit; border-color:#dc3545; border-width: 4px"><br>
          </div>
          <div class="form-group">

            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"  style=" border-radius:50px; background-color:inherit; border-color:#ffc107; border-width: 4px"><br>
          </div>
          <div class="form-group">

            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"  style=" border-radius:50px; background-color:inherit; border-color:#0dcaf0; border-width: 4px"><br>
          </div>
          <div class="form-check">
           <br>
      
          </div>
          <button type="submit" class="btn btn-success">Submit</button>
        </form>         
      </div>
    </div>
  </header><!-- End Header -->

  <!-- ======= About Section ======= -->
  <section id="register" class="about">
      <div class="container">

        <div class="row">
          <div class="col-sm-6">
             <div class="containerr">
			   <img src="webpage/home/pass2.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #ffbf00, #ff9100) 1; width:550px; ">
			  <div class="centered"><h1>REGISTER AS CUSTOMER</h1></div>
			</div>
          </div>
         
          <div class="col-sm-6" style="text-align: center;" >
           <div class="containerr">
			   <img src="webpage/home/agency2.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #00a3ff, #00e8ff) 1; width:550px; ">
			  <div class="centered"><h1>REGISTER AS AGENCY</h1></div>
			</div>
          </div>
          
        </div>
 </section>

 <section id="login" class="about">
      <div class="container">

        <div class="row">
          <div class="col-sm-6">
             <div class="containerr">
			   <img src="webpage/home/passlog.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #ff8200, #ff4d00) 1; width:550px; ">
			  <div class="centered"><h1>LOGIN AS CUSTOMER</h1></div>
			</div>
          </div>
         
          <div class="col-sm-6" style="text-align: center;" >
           <div class="containerr">
              <a href="AgencyLogin.jsp">
			   <img src="webpage/home/agencylog.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #0081ff, #0062ff) 1; width:550px; "></a>
			  <div class="centered"><h1>LOGIN AS AGENCY</h1></div>
			</div>
          </div>
        </div>
</section>

 <section id="passengerManage" class="about">
      <div class="container">

           <div class="row">
            <div class="row">
          <div class="col-sm-4">
             <div class="containerr">
			   <img src="webpage/home/5.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #a2000c, #ff0017) 1; width:390px; ">
			  <div class="centered"><h1>Manage Passenger Details</h1></div>
			</div>
          </div>
          
          <div class="col-sm-4">
             <div class="containerr">
			   <img src="webpage/home/2.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #00937f, #00c8cf) 1; width:390px; ">
			  <div class="centered"><h1>Manage Payment Details</h1></div>
			</div>
          </div>
         
          <div class="col-sm-4" style="text-align: center;" >
           <div class="containerr">
			   <img src="webpage/home/1.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #e8ae00, #cf8500) 1; width:390px; ">
			  <div class="centered"><h1>LOGOUT</h1></div>
			</div>
          </div>
        </div>
</section>

 <section id="agencyManage" class="about">
      <div class="container">

        <div class="row">
            <div class="row">
          <div class="col-sm-3">
             <div class="containerr">
			   <a href="viewAgencyDetails.jsp"><img src="webpage/home/5.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #a2000c, #ff0017) 1; width:390px; "></a>
			  <div class="centered"><h1>Manage Agency Details</h1></div>
			</div>
          </div>
          
          <div class="col-sm-3">
             <div class="containerr">
			   <a href=""> <img src="webpage/home/2.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #00937f, #00c8cf) 1; width:390px; ">
			  <div class="centered"><h1>Manage Bus Details</h1></div>
			</div>
          </div>
         
         <div class="col-sm-3">
             <div class="containerr">
			   <a href=""> <img src="webpage/home/2.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #00937f, #00c8cf) 1; width:390px; ">
			  <div class="centered"><h1>Manage Bus Details</h1></div>
			</div>
          </div>
         
          <div class="col-sm-3" style="text-align: center;" >
           <div class="containerr">
			   <img src="webpage/home/1.jpg" alt="Card image" style="border-style:solid; border-width:5px; border-image: linear-gradient(to right, #e8ae00, #cf8500) 1; width:390px; ">
			  <div class="centered"><h1>LOGOUT</h1></div>
			</div>
          </div>
        </div>
</section>


  <script src="webpage/home/assets/js/main.js"></script>

</body>

</html>


<style>
  .border {
    padding: 35px;
    border-radius: 25px;
    background-color: #f5f5f5;
  }
  
  /* The message box is shown when the user clicks on the password field */
  #message {
    display: none;
  }
  
  /* Add a green text color and a checkmark when the requirements are right */
  .valid {
    color: green;
  }
  
  /* Add a red text color and an "x" when the requirements are wrong */
  .invalid {
    color: red;
  }
  
  .header-top {
    background: rgba(0, 0, 0, 0.5);
}
  
  
  </style>
  
     <style>
.containerr {
  position: relative;
  text-align: center;
  color: white;
}
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
section .container {
    background: rgba(0, 0, 0, 0.5);
    padding: 50px;
}
</style>
  