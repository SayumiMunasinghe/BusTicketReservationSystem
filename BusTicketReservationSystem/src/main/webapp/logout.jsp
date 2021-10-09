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
session.removeAttribute("flag");


if(session.getAttribute("userID") == null){ %>
	<script>
	window.location.href = 'homepage.jsp';
	</script>
<% }

%>

</body>
</html>