<%@ page import="com.btrs.homepage.BusDetails, java.util.ArrayList, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Booking Summary</h1>
<%
	BusDetails bd = (BusDetails)request.getAttribute("busDetails");
	int seats = (int)request.getAttribute("seats");
	String date = (String)request.getAttribute("date");
	double total = (double)request.getAttribute("price");
	ArrayList<String> cards = (ArrayList<String>)request.getAttribute("cardNos");
	String ac;
	if(bd.getAC() == "With A/C")
		ac = "Available";
	else
		ac = "Not available";
%>
<p>Bus ID : <%= bd.getBusID() %></p>
<p>Bus Number : <%= bd.getBusNumber() %></p>
<p>Bus Type : <%= bd.getBusType() %></p>
<p>AC : <%= ac %></p>
<p>Starting Location : <%= bd.getArrival() %></p>
<p>Ending Location : <%= bd.getDestination() %></p>
<p>Journey Date : <%= date %></p>
<p>Journey Start Time : <%= bd.getTime() %></p>
<p>Price Per Seat : <%= bd.getSeatPrice() %></p>
<p>Number Of Seats Reserved : <%= seats %></p>
<p>Total Price : <%= total %></p>
<%
	if(cards.isEmpty()) {
		%><a href="ManagePayment.jsp"><button>Add new card</button></a><%
	}
	else {
		%>
		<form action="PaymentServlet" method="post">
		<p>Select card to make payment: </p>
		<select id="card" name="card">
		<%
		for(int i = 0; i < cards.size(); i++) {
		%>
			<option value="<%= cards.get(i) %>"><%= cards.get(i) %></option>
		<%
		}
		%>
		</select>
		<input type="submit" name="paynow" value="Pay now">
		</form>
		<%
	}
%>

</body>
</html>