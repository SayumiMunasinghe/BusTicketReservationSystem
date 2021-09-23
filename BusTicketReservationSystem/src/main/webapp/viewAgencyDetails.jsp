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
</head>
<body>

<div style="text-align: center;">
      <button id ="1" onclick="buttAction(this.id)" class="btn btn-warning">View Details</button>
      <button id = "2" onclick="buttAction(this.id)" class="btn btn-warning">Update Details</button>
      <button id = "3" onclick="buttAction(this.id)" class="btn btn-warning">Manage Bus</button>
      <button id = "4" onclick="buttAction(this.id)" class="btn btn-warning">Delete Account</button>
      
      <br><br>
      
      <div class="container" id = "table3" style ="display:none;">
       <div class="alert alert-danger">
        
         <p style="font-size:45px;"><b>DELETE ACCOUNT?</b></p> 
         <p style="font-size:25px;"><b>You are about to delete Agency Account. This action cannot be undone!</b></p> 
		 <br><br>
           <form action="ManageAgencyDetailsServlet" method="Post">
  	       <input type="submit" name="deleteDetails" value="DELETE ACCOUNT" class="btn btn-danger">
  	       <button id = "5" onclick="buttAction(this.id)" class="btn btn-default">Cancel</button>  
  	       </form>
  	   </div>
  	 </div>
</div>
	<div class="container" id = "table1">          
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


   <form action="ManageAgencyDetailsServlet" method="Post" id ="table2" style ="display:none;">
	<div class="container">          
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
	        <td> <input type="text" name="agentNIC"" value="${agencyDetails.agentNIC}" class="form-control"></td>
	       
	      </tr>
	      <tr>
	        <td>Agent Name</td>
	        <td> <input type="text" name="agentName" value="${agencyDetails.agentName}" class="form-control"></td>
	      </tr>
		  <tr>
	        <td>Company DOG</td>
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
	 </div>
	<input type="submit" name="updateDetails" value="Update Details" class="btn btn-primary btn-lg btn-block">
   </form>

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
  		window.location="homepage.jsp";	 
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