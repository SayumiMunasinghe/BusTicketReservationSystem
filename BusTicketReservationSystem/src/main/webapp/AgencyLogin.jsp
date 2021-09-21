<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Agency Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<br><br><br><br><br>

<body>
<br><br><br>
<div class="container">
  <h2>Agency Login Page</h2>
  <form class="form-horizontal" action="AgencyLoginServlet" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Agent Username:</label>
      <div class="col-sm-9">
        <input type="text" name="userName" placeholder="Enter username" class="form-control">
     </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">Agent password:</label>
      <div class="col-sm-9">
 		<input type="text" name="password" placeholder ="Enter password" class="form-control">
      </div>
      </div>
      
     <% String popup = (String)request.getAttribute("popup");
		if(popup == "1"){
			%><div class="" id = "popupp">
			  <div class="alert alert-danger alert-dismissible fade in">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>Username or Password is incorrect!</strong> Username or password does not match.
			  </div>
			</div><%
		}%>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" name="submit" value="Login" class="btn btn-default">

      </div>
    </div>
  </form>
</div>


</body>
</html>