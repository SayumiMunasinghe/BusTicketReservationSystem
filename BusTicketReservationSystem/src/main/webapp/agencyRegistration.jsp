<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Agency Registration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
   
	<div class="container">
	<div class ="border">
	  <h2>Agency Registration</h2>
	  <form class="form-horizontal" action="AgencyRegistrationServlet" method="post">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Agent Name:</label>
	      <div class="col-sm-9">
	        <input type="text" name="agentName" placeholder="Enter name" class="form-control">
	     </div>
	    </div>
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="email">agent NIC:</label>
	      <div class="col-sm-9">
	 		<input type="text" name="agentNIC" value="John" class="form-control">
	      </div>
	      </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">companyName:</label>
	      <div class="col-sm-9">
	        <input type="text" name="companyName" value="Doe" class="form-control">
	      </div>
	    </div>
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="email">agentPhone:</label>
	      <div class="col-sm-9">
	          <input type="text" name="agentPhone" value="John" class="form-control">
	      </div>
	    </div>
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="email">agentEmail:</label>
	      <div class="col-sm-9">
	        <input type="email" name="agentEmail" value="Doedwww@gmail.com" class="form-control" required>
	      </div>
	    </div>
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="email">agencyLocation:</label>
	      <div class="col-sm-9">
	         <input type="text" name="agencyLocation" value="Doe" class="form-control">
	      </div>
	    </div>
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="email">password:</label>
	      <div class="col-sm-9">
	        <input type="password"  name="password" id ="pws" class="form-control" required>
	      </div>
	    </div>
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="email">confirmPassword:</label>
	      <div class="col-sm-9">
	        <input type="password" name="confirmPassword" id ="cpws" class="form-control" required>
	      </div>
	    </div>
	       <div class="form-group">
	      <label class="control-label col-sm-2" for="email">userName:</label>
	      <div class="col-sm-9">
	        <input type="text" name="userName" placeholder="Enter username" class="form-control" required>
	      </div>
	    </div>
	    
	    <% String popup = (String)request.getAttribute("popup");
		if(popup == "1"){
			%><div class="" id = "popupp">
			  <div class="alert alert-danger alert-dismissible fade in">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>Username Exists!</strong> Username already exists. Please enter a different username or login.
			  </div>
			</div><%
		}else if(popup == "2"){
			%><div class="" id = "popupp">
			  <div class="alert alert-danger alert-dismissible fade in">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>Email Already Exists!</strong> Email already exists. Please enter a different email or login.
			  </div>
			</div><%
		}%>
	    
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <input type="submit" name="submit" value="Register" class="btn btn-default" onclick="return Validate()">
	
	      </div>
	    </div>
	  </form>
	</div>
  </div>

	<style>
	.border{
  		padding: 35px;
  		border-radius: 25px;
  		background-color: #f5f5f5;
	}

	</style>

	<script type="text/javascript">
	    function Validate() {
	        var password = document.getElementById("pws").value;
	        var confirmPassword = document.getElementById("cpws").value;
	        if (password != confirmPassword) {
	            alert("Passwords do not match.");
	            return false;
	        }
	        return true;
	    }
	</script>

</body>
</html>



