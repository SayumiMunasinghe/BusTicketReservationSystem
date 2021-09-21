<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Agency Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>


<div class="container">

    <form class="form-horizontal" action="ManageAgencyDetailsServlet" method="Post">
    	<input type="submit" name="viewDetails" value="View Details" class="btn btn-primary btn-lg btn-block">
    </form>
 
     <form action="ViewAgencyDetailsServlet" method="Post">
    	<input type="submit" name="testing" value="Delete Details" class="btn btn-primary btn-lg btn-block">
    </form>
 
</div>

</body>
</html>


