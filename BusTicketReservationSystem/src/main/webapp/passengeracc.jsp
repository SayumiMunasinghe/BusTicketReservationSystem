<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- below jstl used to call a java class while in jsp class -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

		<%
     if("${userID}" == null || "${mode}" == null){ %>
	     <script>
			window.location.href = 'PassengrLogin.jsp';
		</script>
     <%}
%>

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
		
		<c:set var="pid" value="${pass.pid}"/>
		<c:set var="fname" value="${pass.fName}"/>
		<c:set var="lname" value="${pass.lName}"/>
		<c:set var="email" value="${pass.email}"/>
		<c:set var="phone" value="${pass.telno}"/>
		<c:set var="pwd" value="${pass.password}"/>
		
			<tr>
			<!-- this below one calls the getpid function in passenger, java class -->
				<td>${pass.pid}<span id="ch"></span></td>
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