<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logging out...</title>
</head>
<body>

<%
session.removeAttribute("userID");
session.removeAttribute("mode");

if(session.getAttribute("userID") == null){ %>
	<script>
	window.location.href = 'TempHomepage.jsp';
	</script>
<% }

%>

</body>
</html>