<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
<title>View Agency Data</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
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
    
    .border {
	padding: 35px;
	border-radius: 25px;
	background-color: #f5f5f5;
}
  </style>
  	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="webpage/assets/css/style.css" rel="stylesheet"> 
	<style>
		.border {
			padding: 35px;
			border-radius: 25px;
			background-color: #f5f5f5;
		}
		.navbar{
			position: relative;
			display: flex;
			flex-wrap:wrap;
			align-items: center;
			justify-content: space-between;
		}
	</style>
</head>

<%
	if(session.getAttribute("mode") == null){ %>
	     <script>
			window.location.href = 'AgencyLogin.jsp';
		</script>
     <%}
%>

<body onload="myFunction()">


<form id="autosub" class="form-horizontal" action="ManageAgencyDetailsServlet" method="Post">
    <input type="hidden" name="viewDetails" value="Manage Agency Details"> 
</form>

	<script>
	if(("${loadOne}" != "1"))
	function myFunction() {
		 document.getElementById('autosub').submit();
	}
	</script>

  <header id="header" class="header-top">
    <div class="container" >
      <h1><a href="index.html">OnlineBTRS</a></h1>
      <h2>We made booking <span>Bus Tickets </span> Revolutionary for Everyone</h2>
      <nav id="navbar" class="navbar" style="background-color:inherit">
        <ul style="background-color:inherit">
          <li><a class="nav-link active" href="TempHomepage.jsp">Home</a></li>
          <li><a class="nav-link" href="#about">About</a></li>
                <% Integer loginStatus = (Integer)session.getAttribute("userID");
		            String loginMode = (String)session.getAttribute("mode");
			 	if(loginStatus == null || loginMode == null){ %> 
          <li><a class="nav-link" href="#register">Register</a></li>
          <li><a class="nav-link" href="#login">Login</a></li>
             	<% }else if (loginMode == "passenger"){ %>  
          <li><a class="nav-link" onclick="autoPassenger()">Manage Passenger</a></li>
                <% }else if (loginMode == "agency"){ %> 
          <li><a class="nav-link" onclick="autoAgency()">Manage Agency</a></li>
                <% } else { 
					session.removeAttribute("userID");
					session.removeAttribute("mode");
				 %> 
					 <script>
					  window.location.href = 'TempHomepage.jsp';
					 </script> 
				 <% } %>
        </ul>
        <script>
          function autoAgency(){
        	  <% String button = "Agency";
        	     session.setAttribute("Agency", button);%>
        	     window.location.href = 'TempHomepage.jsp';
          }
          
          function autoPassenger(){
        	  <% String button2 = "Passenger";
        	     session.setAttribute("Passenger", button2);%>
        	     window.location.href = 'TempHomepage.jsp';
          }
        </script>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header>


<br><br><br><br><br>

<div style="text-align: center;">
      <button id ="1" onclick="buttAction(this.id)" class="btn btn-warning">View Details</button>
      <button id = "2" onclick="buttAction(this.id)" class="btn btn-warning">Update Details</button>
      <button id = "3" onclick="buttAction(this.id)" class="btn btn-warning">Manage Bus</button>
      <button id = "4" onclick="buttAction(this.id)" class="btn btn-warning">Delete Account</button>
      
      <br><br>
      
      <div class="container" id = "table3" style ="display:none;">
       <div class="alert alert-danger" style="padding:90px ;background-image: linear-gradient(to bottom, rgba(255, 163, 163, 0.95) 0%,rgba(255, 163, 163, 0.95) 0%), url(https://www.seekpng.com/png/full/46-463085_desktop-free-triangle.png)">
        
         <p style="font-size:45px;"><b>DELETE ACCOUNT?</b></p> 
         <p style="font-size:25px;"><b>You are about to delete Agency Account. This action cannot be undone!</b></p> 
		 <br><br>		 
           <form action="ManageAgencyDetailsServlet" method="Post">
  	       <input type="submit" name="deleteDetails" value="DELETE ACCOUNT" class="btn btn-danger">
  	       </form><br>
  	       <button id = "5" onclick="buttAction(this.id)" class="btn btn-default">Cancel</button>  
  	   </div>
  	 </div>
  	 
</div>
	<div class="container" id = "table1">       
	<div class="border" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(247, 247, 247, 0.95) 0%), url(https://www.seekpng.com/png/full/46-463085_desktop-free-triangle.png)">   
	  <table class="table">
	  <c:forEach var="agencyDetails" items = "${agencyListDetails}">
	  
	    <thead>
	      <tr>
	        <th>Type</th>
	        <th>Details</th>
	      </tr>
	    </thead>
	    <tbody>
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
	<div class="border" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(247, 247, 247, 0.95) 0%), url(https://www.seekpng.com/png/full/46-463085_desktop-free-triangle.png)">         
	  <table class="table">
	  <c:forEach var="agencyDetails" items = "${agencyListDetails}">
	  
	    <thead>
	      <tr>
	        <th>Type</th>
	        <th>Details</th>
	      </tr>
	    </thead>
	    <tbody>
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
	        <td> <input type="text" name="agentPhone" value="${agencyDetails.agentPhone}" class="form-control"></td>
	      </tr>
	      <tr>
	        <td>Agent Email</td>
	        <td> <input type="text" name="agentEmail" value="${agencyDetails.agentEmail}" class="form-control"></td>
	      </tr>
	      <tr>
	        <td>Agency location</td>
	        <td> <input type="text" name="agencyLocation" value="${agencyDetails.agencyLocation}" class="form-control"></td>
	      </tr>
	      <tr>
	        <td>Agent password</td>
	        <td> <input type="text" name="password" value="${agencyDetails.password}" class="form-control"></td>
	      </tr>
	      <tr>
	        <td>Agent username</td>
	        <td> <input type="text" name="userName" value="${agencyDetails.username}" class="form-control"></td>
	      </tr>
	    </tbody>
	    </c:forEach>
	   </table>
	 
	<input type="submit" name="updateDetails" value="Update Details" class="btn btn-success btn-lg btn-block" >
   </form>
   </div> 
  </div>

<script type="text/javascript">
  function buttAction(buttonVal)
  {
     if(buttonVal == "1"){
       document.getElementById('table1').style.display = "block";
       document.getElementById('table2').style.display = "none";
       document.getElementById('table3').style.display = "none";
  	 }else if(buttonVal == "2"){
	  document.getElementById('table2').style.display = "block";
      document.getElementById('table1').style.display = "none";
      document.getElementById('table3').style.display = "none";
  	 }else if(buttonVal == "3"){
  		window.location="enterBusDetails.jsp";	 
  	 }else if(buttonVal == "4"){
  		document.getElementById('table2').style.display = "none";
        document.getElementById('table1').style.display = "none";
        document.getElementById('table3').style.display = "block";
  	 }else if(buttonVal == "5"){
  		document.getElementById('table1').style.display = "block";
        document.getElementById('table2').style.display = "none";
        document.getElementById('table3').style.display = "none";
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