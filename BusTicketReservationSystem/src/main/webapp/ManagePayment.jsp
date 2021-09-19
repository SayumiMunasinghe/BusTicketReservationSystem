
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <form action="insert" method="post">
          <input type ="radio" id="visa" name="type" value="Visa" checked>
           <label for="visa">Visa</label>
           <input type ="radio" id="mastercard" name="type" value="MasterCard">
           <label for="visa">MasterCard</label>
           <input type ="radio" id="express" name="type" value="American Express">
           <label for="visa">American Express</label>
           <input type ="radio" id="discover" name="type" value="Discover">
           <label for="visa">Discover</label>
           <br>
           Card Number:<input type ="text" pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" name="cno" placeholder="xxxx-xxxx-xxxx-xxx" required><br> 
           Card Holder Name:<input type="text" name="hName" required ><br>
           CVV:<input type="text" name="cvv" pattern="[0-9]{3}" required><br>
           Expiry Date:<input type="text" pattern="[0-9]{2}/[0-9]{2}" name="date" placeholder="MM/YY" required>
           <input type="submit" value="Add Card" name="submit">
        </form>
</body>
</html>