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

<% //String showTable1 = (String)request.getAttribute("showTable1");
String showTable1 = "1";
    if(showTable1 == "1"){
    %>

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
<%
}%>


<% //String showTable2 = (String)request.getAttribute("showTable2");
    String showTable2 = "1";
   if(showTable2 == "1"){
    %>
   <form  action="ManageAgencyDetailsServlet" method="Post">
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
<%
}%>
    
    
<% 
     if(request.getParameter("tableSwitch") == "true") {
            showTable1 = "0";
            showTable2 = "1";
     }
%>


    <form action="ManageAgencyDetailsServlet" method = "post">
     <INPUT TYPE="Submit"  name ="updateDetails" VALUE="Update" >
    </form>

    
    


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