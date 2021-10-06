<%@ page import="java.util.ArrayList, com.btrs.homepage.Order, com.btrs.homepage.BusTimes" %>
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
	Order order = (Order)request.getAttribute("order");
	ArrayList<BusTimes> bt = (ArrayList<BusTimes>)request.getAttribute("busTimes");
	if(bt.size() == 0 )
	{
		HttpSession session2 = request.getSession();
		String flag = "failure";
		session2.setAttribute("flag", flag);
		RequestDispatcher dis = request.getRequestDispatcher("homepage.jsp");
		dis.forward(request, response);
	}
%>
	<form action="" method="POST">
	<p>Current journey time: <%= order.getTime() %></p>
	<p>Choose time to update booking: </p>
		<input type="hidden" name="orderid" value="<%= order.getOrderID()%>">
		<select id="time" name="time">
		<%
		for(int i = 0; i < bt.size(); i++) {
		%>
			<option value="<%= bt.get(i).getTime()+" "+ bt.get(i).getBusid()%>"><%= bt.get(i).getTime() %></option>
		<%
		}
		%>
		</select>
		<input type="submit" name="updateTime" value="Update time">		
	</form>
</body>
</html>