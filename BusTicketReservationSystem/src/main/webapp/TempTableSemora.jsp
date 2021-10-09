<!doctype html>
<html lang="en">
  <head>
  	<title>Table 07</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="webpage/Agencyform/css/manage.css">

<style>
	.table-wrap{overflow-x: inherit;}
	 .container-fluid {
    padding: 60px 50px;
  }
  <style>
   body, html{
	width: 100%;
	height: 100%;
	background-size:cover;
	font-family: Life Savers;
}
  .bg-grey {
    background-color: #202020;
    color: white;
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
 .table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
    border: 1px solid red;
}

</style>


	</head>
	 <body style="background-image: url('webpage/home/assets/img/bg.jpg');">

		<nav class="navbar navbar-default navbar-fixed-top">
		  <div class="container-lg" style="padding-left: 5%; padding-right: 5%;">
			<div class="navbar-header">
			  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>                        
			  </button>
			  <a class="navbar-brand" href="homepage.jsp" style="font-size: 28px;">O<span style="color:#C3073F;">BTRS</span> </a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			  <ul style="font-size: 18px;" class="nav navbar-nav navbar-right">
				<li class="nav-item"><a href="https://peterpanbus.com/company/our-story/">ABOUT</a></li>
				<li class="nav-item"><a href="https://peterpanbus.com/help/">CONTACT</a></li>
						<% Integer loginStatus = (Integer)session.getAttribute("userID");
						   String loginMode = (String)session.getAttribute("mode");
						if(loginStatus == null || loginMode == null){ %> 
							 <li><a class="" type="button" data-toggle="dropdown">REGISTER</a>
								<ul class="dropdown-menu" style="background-color: black;">
								  <li><a href="passengerinsert.jsp" >Register as Passenger</a></li>
								  <li><a href="agencyRegistration.jsp">Register as Agency</a></li>
								</ul>
							  </li>
							  <li><a class="" type="button" data-toggle="dropdown">LOGIN</a>
								<ul class="dropdown-menu" style="background-color: black;">
								  <li><a href="PassengerLogin.jsp" >Login as Passenger</a></li>
								  <li><a href="AgencyLogin.jsp">Login as Agency</a></li>
								</ul>
							  </li>
						<% }else if (loginMode == "passenger"){ %>  
							<li><a class="" type="button" data-toggle="dropdown">MANAGE PASSENGER</a>
							<ul class="dropdown-menu" style="background-color: black;">
							  <li><a href="ManagePassenger.jsp" >Manage Passenger Details</a></li>
							  <li><a href="ManagePayment.jsp">Manage Payment</a></li>
							  <li><a href="logout.jsp">Logout</a></li>
							</ul>
						<% }else if (loginMode == "agency"){ %> 
							 <li><a class="" type="button" data-toggle="dropdown">MANAGE AGENCY</a>
							  <ul class="dropdown-menu" style="background-color: black;">
							  <li><a href="viewAgencyDetails.jsp">Manage Agency Details</a></li>
							  <li><a href="readBusDetails.jsp">Manage Bus Details</a></li>
							  <li><a href="logout.jsp">Logout</a></li>
							</ul>
						<% } else { 
							session.removeAttribute("userID");
							session.removeAttribute("mode");
						%> 
							 <script>
							  window.location.href = 'homepage.jsp';
							 </script> 
						<% } %>
			  </ul>
			</div>
		  </div>
		</nav>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Table #07</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table table-bordered table-dark table-hover" style="background-color:transparent; ;background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(80, 10, 10, 0.4));">
						  <thead>
						    <tr >
						      <th>#</th>
						      <th>First Name</th>
						      <th>Last Name</th>
						      <th>Email</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>Mark</td>
						      <td>Otto</td>
						      <td>markotto@email.com</td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>Jacob</td>
						      <td>Thornton</td>
						      <td>jacobthornton@email.com</td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td>Larry</td>
						      <td>the Bird</td>
						      <td>larrybird@email.com</td>
						    </tr>
						    <tr>
						      <th scope="row">4</th>
						      <td>John</td>
						      <td>Doe</td>
						      <td>johndoe@email.com</td>
						    </tr>
						    <tr>
						      <th scope="row">5</th>
						      <td>Gary</td>
						      <td>Bird</td>
						      <td>garybird@email.com</td>
						    </tr>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>


	

	</body>
</html>

