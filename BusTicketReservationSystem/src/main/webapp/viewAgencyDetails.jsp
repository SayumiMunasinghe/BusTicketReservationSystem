<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <title>Manage Details</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
   body, html{
	width: 100%;
	height: 100%;
	background-size:cover;
	font-family: Life Savers;
   }
 
  .jumbotron {
    background-color: #202020;
    color: #fff;
    padding: 100px 25px;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #202020;
    color: white;
  }
  .logo-small {
    color: #202020;
    font-size: 50px;
  }
  .logo {
    color: #202020;
    font-size: 200px;
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
  }
  ::-webkit-calendar-picker-indicator {
	    filter: invert(1);
	}
   .table>thead>tr>th {
    vertical-align: bottom;
    border-bottom: 0px;
    }
      .active, .butt:hover {
		  background-color: #666;
		  color: pink;
			}
        .butt{
		    border-radius:50px;
		    padding:10px 20px;
		  }
		  .butt:hover{
		    color: #white !important;
		    background-color: #C3073F !important;
		  }
		  .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
		    padding: 15px;
		    line-height: 1.42857143;
		    vertical-align: top;
		    border-top: 0px solid black;
		}
		.form-control{
		  background-color:transparent;
		  color:white;
		  border-style: none;
		  border-bottom: solid;
		  border-color: #6F2232;

		}
		
         .btn-grad {background-image:linear-gradient(to right, #6F2232 0%, #C3073F  40%, #6F2232  100%)}
         .btn-grad {
            margin: 10px;
            padding: 13px 20px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            border-style: none;
            border-radius: 50px;

          }

          .btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
          @media (min-width: 1200px)
			.container {
			    width: 950px;
			}
			
		 .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 10px;
         }
  </style>
</head>


<% // Checks if user is logged in or not
	if(session.getAttribute("mode") == null || session.getAttribute("userID") == null){ %>
	     <script>
			window.location.href = 'AgencyLogin.jsp';
		</script>
     <%}
%>

<body style="background-image: url('webpage/home/assets/img/bg.jpg'); " onload="myFunction()">

<form id="autosub" class="form-horizontal" action="ManageAgencyDetailsServlet" method="Post">
    <input type="hidden" name="viewDetails" value="Manage Agency Details"> 
</form>

	<script>
	if(("${loadOne}" != "1"))
	function myFunction() {
		 document.getElementById('autosub').submit();
	}
	</script>


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
					  <li><a href="enterBusDetails.jsp">Add Bus Details</a></li>
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
  

<br><br><br><br>

<div style="text-align: center;">
     <div id ="buttSet">
      <button id ="1" onclick="buttAction(this.id)" class="butt btn-grad" style ="padding:25px;">View Details</button>
      <button id = "2" onclick="buttAction(this.id)" class="butt btn-grad">Update Details</button>
      <button id = "3" onclick="buttAction(this.id)" class="butt btn-grad">Manage Bus</button>
      <button id = "4" onclick="buttAction(this.id)" class="butt btn-grad">Delete Account</button>
     </div>
      
      <script>
		// Add active class to the current button (highlight it)
		var header = document.getElementById("buttSet");
		var btns = header.getElementsByClassName("burr");
		for (var i = 0; i < btns.length; i++) {
		  btns[i].addEventListener("click", function() {
		  var current = document.getElementsByClassName("active");
		  current[0].className = current[0].className.replace(" active", "");
		  this.className += " active";
		  });
		}
	  </script>
      
      <style>
	    
      </style>
      
      
      
      <div class="container" id = "table3" style ="display:none;">
       <div class="alert alert-danger" style="padding:90px ;background-image: linear-gradient(to bottom, rgba(82, 0, 0, 0.95) 0%,rgba(82, 0, 0, 0.95) 0%), url(https://www.seekpng.com/png/full/46-463085_desktop-free-triangle.png) ; color: white;">
        
         <p style="font-size:45px;"><b>DELETE ACCOUNT?</b></p> 
         <p style="font-size:25px;"><b>You are about to delete Agency Account. This action cannot be undone!</b></p> 
		 <br><br>		 
           <form action="ManageAgencyDetailsServlet" method="Post">
  	       <input type="submit" name="deleteDetails" value="DELETE ACCOUNT" class="btn btn-danger" style="padding: 40px 180px">
  	       </form><br>
  	       <button id = "5" onclick="buttAction(this.id)" class="btn btn-default" >Cancel</button>  
  	   </div>
  	 </div>
  	 
</div>
	<div class="container" id = "table1">       
	<div class="border" style="background-image: url(webpage/Agencyform/images/1.png); background-size: 260px">   
	  <table class="table" style="background-image: url(https://www.pngkey.com/png/full/8-80192_free-distinct-patterns-naldz-infinite-design-cube-black.png) ;background-color: transparent ;background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(80, 10, 10, 0.4)) ;
	  color: white; border-radius: 25px;">
	  <c:forEach var="agencyDetails" items = "${agencyListDetails}">
	  
	    <thead style="font-family: HP-Simplified;">
	      <tr>
	        <th style="font-size:25px">Type</th>
	        <th style="font-size:25px">Details</th>
	      </tr>
	    </thead>
	    <tbody style="font-family: HP-Simplified;">
	      <tr>
	        <td>Agent NIC</td>
	        <td>${agencyDetails.agentNIC}</td>
	      </tr>
	      <tr>
	        <td>Agent Name</td>
	        <td>${agencyDetails.agentName}</td>
	      </tr>
		  <tr>
	        <td>Company Name</td>
	        <td>${agencyDetails.companyName}</td>
	      </tr>
	      <tr>
	        <td>Agent phone</td>
	        <td>${agencyDetails.agentPhone}</td>
	      </tr>
	      <tr>
	        <td>Agent Email</td>
	        <td>${agencyDetails.agentEmail}</td>
	      </tr>
	      <tr>
	        <td>Agency location</td>
	        <td>${agencyDetails.agencyLocation}</td>
	      </tr>
	      <tr>
	        <td>Agent password</td>
	        <td>${agencyDetails.password}</td>
	      </tr>
	      <tr>
	        <td>Agent username</td>
	        <td>${agencyDetails.username}</td>
	      </tr>
	    </tbody>
	    </c:forEach>
	   </table>
	 </div>
 </div>

   <form action="ManageAgencyDetailsServlet" method="Post" id ="table2" style ="display:none;">
	<div class="container">      
	<div class="border" >         
	  <table class="table" style=" background-color: transparent ;background-image: url(webpage/Agencyform/images/1.png); background-size: 20%);
	  color: white; border-radius: 25px">
	
	  <c:forEach var="agencyDetails" items = "${agencyListDetails}">
	  
	    <thead style="font-family: HP-Simplified; background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(80, 10, 10, 0.4))">
	      <tr>
	        <th style="font-size:25px">Type</th>
	        <th style="font-size:25px">Enter new details</th>
	      </tr>
	    </thead>
	    <tbody style="font-family: HP-Simplified; background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(80, 10, 10, 0.4))">
	      <tr>
	        <td>Agent NIC</td>
	        <td> <input type="text" name="agentNIC" value="${agencyDetails.agentNIC}" class="form-control"></td>
	       
	      </tr>
	      <tr>
	        <td>Agent Name</td>
	        <td> <input type="text" name="agentName" value="${agencyDetails.agentName}" class="form-control"></td>
	      </tr>
		  <tr>
	        <td>Company Name</td>
	        <td> <input type="text" name="companyName" value="${agencyDetails.companyName}" class="form-control"></td>
	      </tr>
	      <tr>
	        <td>Agent phone</td>
	        <td> <input type="text" name="agentPhone" value="${agencyDetails.agentPhone}" class="form-control" pattern="[0-9]{10}"></td>
	      </tr>
	      <tr>
	        <td>Agent Email</td>
	        <td> <input type="email" name="agentEmail" value="${agencyDetails.agentEmail}" class="form-control"></td>
	      </tr>
	      <tr>
	        <td>Agency location</td>
	        <td> <input type="text" name="agencyLocation" value="${agencyDetails.agencyLocation}" class="form-control"></td>
	      </tr>
	      <tr>
	        <td>Agent password</td>
	        <td> <input type="text" name="password" value="${agencyDetails.password}" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" ></td>
	      </tr>
	      <tr>
	        <td></td>
	        <td> <input type="hidden" name="userName" value="${agencyDetails.username}" class="form-control"></td>
	      </tr>
	    </tbody>
	    </c:forEach>
	   </table>
	    </div> 
	<input type="submit" name="updateDetails" value="Update Details" class="btn-grad" style="background-image: linear-gradient(to right, #DCE35B 0%, #45B649  51%, #DCE35B  100%)">
   </div>
   </form>

  </div>

<script type="text/javascript">
  function buttAction(buttonVal)
  {
     if(buttonVal == "1"){
       document.getElementById('table1').style.display = "block";
       document.getElementById('table2').style.display = "none";
       document.getElementById('table3').style.display = "none";    
       document.getElementById("1").style.padding= '25px';
       document.getElementById("2").style.padding= '13px';
       document.getElementById("4").style.padding= '13px';
  	 }else if(buttonVal == "2"){
	  document.getElementById('table2').style.display = "block";
      document.getElementById('table1').style.display = "none";
      document.getElementById('table3').style.display = "none";
      document.getElementById("1").style.padding= '13px';
      document.getElementById("2").style.padding= '25px';
      document.getElementById("4").style.padding= '13px';
  	 }else if(buttonVal == "3"){
  		window.location="readBusDetails.jsp";	 
  	 }else if(buttonVal == "4"){
  		document.getElementById('table2').style.display = "none";
        document.getElementById('table1').style.display = "none";
        document.getElementById('table3').style.display = "block";
        document.getElementById("1").style.padding= '13px';
        document.getElementById("2").style.padding= '13px';
        document.getElementById("4").style.padding= '25px';
  	 }else if(buttonVal == "5"){
  		document.getElementById('table1').style.display = "block";
        document.getElementById('table2').style.display = "none";
        document.getElementById('table3').style.display = "none";
        document.getElementById("1").style.padding= '25px';
        document.getElementById("2").style.padding= '13px';
        document.getElementById("4").style.padding= '13px';
  	 }
  }
</script>

      <% String popup = (String)request.getAttribute("popup1");
		if(popup == "1"){
			%><div class="" id = "popupp">
			  <div class="alert alert-danger alert-dismissible fade in">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>Data Could Not Be Accessed!</strong> Please enter valid data.
			  </div>
			</div><%
		}%>

</body>
</html>