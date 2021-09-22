<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Passenger Account</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Passenger</h2>            
  <table class="table table-striped">
    <thead>
      <tr>
      	<th>Passenger ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Password</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="pass" items="${passDetails}">
			<tr>
				<td>${pass.pid}</td>
				<td>${pass.fName}</td>
				<td>${pass.lName}</td>
				<td>${pass.email}</td>
				<td>${pass.telno}</td>
				<td>${pass.password}</td>
			</tr>
		</c:forEach>
	</tbody>
  </table>
</div>

</body>
</html>