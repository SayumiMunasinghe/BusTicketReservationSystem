<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		//give the parameter argument as the name of c param tags in passengeracc.jsp
		String id= request.getParameter("pid");
		String fname= request.getParameter("fname");
		String lname= request.getParameter("lname");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String pass= request.getParameter("pwd");	
	%>	

	<form action="UpdatePassengerServlet" method="post">
		
		PID<input type="text" name="passid" value="<%= id%>" readonly><br>
		FNAME<input type="text" name="lname" value="<%= fname%>"><br>
		LNAME<input type="text" name="fname" value="<%= lname%>"><br>
		TELNO<input type="text" name="tel" value="<%= email%>"><br>
		EMAIL<input type="email" name="email" value="<%= phone%>"><br>
		PASSWORD<input type="password" name="pwd" value="<%= pass%>"><br>
		
		<input type="submit" name="submit value="update">
	
	</form>


</body>
</html>