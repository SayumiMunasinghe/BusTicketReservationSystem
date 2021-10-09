<%@ page import=" java.util.ArrayList, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <title>Personal Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<link rel="icon" href="https://www.freeiconspng.com/uploads/red-bus-icon-8.png">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

 <style>
     
     .gota{
            top:20%;
            left : 35%;
	  		padding:20px 35px 20px 35px;
	  		font-family: Life Savers;
	 	    color: #C3073F !important;
	 	    position:absolute;
	 	   
	}
	
	 input[type="radio"]:active {
	       color:#C3073F !important;
	 }
	
	input[type="text"]
 { 
    background:transparent;
    color:white;
    border-bottom: 1px solid #C3073F !important;
    border:none;
}
    select{
     background:none;
     
    }
     #f1{
        border:1px solid;
        padding:20px 35px 20px 35px;
         border-color:#C3073F !important;
      }
       
       #f3{
        border:1px solid;
        border-color:#C3073F !important;
        padding:20px 35px 20px 35px;
         height: 472px;
        width:466px;
        
      }
      #f2{
          border:1px solid;
          padding:20px 35px 20px 35px;
           height: 472px;
          width:466px;
          border-color:#C3073F !important;
      }
	
	.tab {
	      top:23%;
          left:30%;
          border: 1px solid #ccc;
          background-color: transparent;
          width: 7%;
          height: 472px;
          position:absolute;
          border-color:#C3073F !important;
          
}

	
   	.tab button {
          display: block;
          background-color: inherit;
          color:#ccc;
          padding: 22px 16px;
          width: 100%;
          border: none;
          outline: none;
          text-align: left;
          cursor: pointer;
          font-family: Life Savers;
}

     .tab button:hover {
          background-color: #C3073F !important;
}
       
            
     #b3{
             left:54%;
             position:absolute;
             top:19%;
     
     }
  body, html{
	width: 100%;
	height: 100%;
	background-size:cover;
	font-family: Life Savers;
}
 
 
  .jumbotron {
    background-color: #202020;
    color: #fff;
    padding: 100px 25px;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #202020;
    color: white;
  }
  .logo-small {
    color: #202020;
    font-size: 50px;
  }
  .logo {
    color: #202020;
    font-size: 200px;
  }

  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }

  .navbar {
    margin-bottom: 0;
    background-color: transparent;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #white !important;
    background-color: #C3073F !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
  }
  ::-webkit-calendar-picker-indicator {
	    filter: invert(1);
	}
	 
	


    </style>

</head>

<%
	if(session.getAttribute("mode") == null){ %>
	     <script>
			window.location.href = 'PassengerLogin.jsp';
		</script>
     <%}
%>




 <body style="background-image: url('webpage/home/assets/img/bg.jpg');">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-lg" style="padding-left: 5%; padding-right: 5%;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="homepage.jsp" style="font-size: 28px;">O<span style="color:#C3073F;">BTRS</span> </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul style="font-size: 18px;" class="nav navbar-nav navbar-right">
        <li class="nav-item"><a href="https://peterpanbus.com/company/our-story/">ABOUT</a></li>
        <li class="nav-item"><a href="https://peterpanbus.com/help/">CONTACT</a></li>
		        <% Integer loginStatus = (Integer)session.getAttribute("userID");
		           String loginMode = (String)session.getAttribute("mode");
				if(loginStatus == null || loginMode == null){ %> 
					 <li><a class="" type="button" data-toggle="dropdown">REGISTER</a>
			            <ul class="dropdown-menu" style="background-color: black;">
			              <li><a href="passengerinsert.jsp" >Register as Passenger</a></li>
			              <li><a href="agencyRegistration.jsp">Register as Agency</a></li>
			            </ul>
			          </li>
			          <li><a class="" type="button" data-toggle="dropdown">LOGIN</a>
			            <ul class="dropdown-menu" style="background-color: black;">
			              <li><a href="PassengerLogin.jsp" >Login as Passenger</a></li>
			              <li><a href="AgencyLogin.jsp">Login as Agency</a></li>
			            </ul>
			          </li>
				<% }else if (loginMode == "passenger"){ %>  
					<li><a class="" type="button" data-toggle="dropdown">MANAGE PASSENGER</a>
		            <ul class="dropdown-menu" style="background-color: black;">
		              <li><a href="ManagePassenger.jsp" >Manage Passenger Details</a></li>
		              <li><a href="ManagePayment.jsp">Manage Payment</a></li>
		              <li><a href="logout.jsp">Logout</a></li>
		            </ul>
				<% }else if (loginMode == "agency"){ %> 
					 <li><a class="" type="button" data-toggle="dropdown">MANAGE AGENCY</a>
		              <ul class="dropdown-menu" style="background-color: black;">
		              <li><a href="viewAgencyDetails.jsp">Manage Agency Details</a></li>
		              <li><a href="readBusDetails.jsp">Manage Bus Details</a></li>
		              <li><a href="logout.jsp">Logout</a></li>
		            </ul>
				<% } else { 
					session.removeAttribute("userID");
					session.removeAttribute("mode");
				%> 
					 <script>
					  window.location.href = 'homepage.jsp';
					 </script> 
				<% } %>
      </ul>
    </div>
  </div>
</nav>

    
 <script type="text/javascript">
         
 
 
 
  function showForm(clickedId)
  {
     if(clickedId == "but1"){
       document.getElementById('f1').style.display = "block";
       document.getElementById('f2').style.display = "none";
       document.getElementById('f3').style.display = "none";
       document.getElementById('but2').style.background = "transparent";
       document.getElementById('but1').style.background = "#C3073F";
      
      
  }else if(clickedId == "but2"){
	  document.getElementById('f1').style.display = "none";
	  document.getElementById('but1').style.background = "transparent";
	  document.getElementById('but2').style.background = "#C3073F";
	 
	  
	 
  }
  }
 
 </script>
 
 
 <div class="tab">
      <button class="tablinks" id ="but1" onclick="showForm(this.id)" >Add Card</button>
      
      <form action="addCardServlet" method="post"  >
      <button class="tablinks" id = "but2" name="submit1" onclick="showForm(this.id)"  >Update Card</button>
      </form>
      
      <br>
      <br>
     </div>
     
    <div class="container">
        <div class="gota">
       <form action="addCardServlet" method="post" id="f1" >
       
         <label>
          <input type ="radio" id="visa" name="type" value="Visa"  checked >
          <img width="80" height="50" src="data:image/png;base64,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">
         </label>
         <label>
           <input type ="radio" id="mastercard" name="type" value="MasterCard">
           <img width="80" height="50" src="data:image/png;base64,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">
          </label>
         <label>
           <input type ="radio" id="express" name="type" value="American Express">
           <img width="80" height="50" src="data:image/png;base64,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">
         </label>
         <label>
           <input type ="radio" id="discover" name="type" value="Discover">
           <img width="80" height="50" src="data:image/png;base64,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">
         </label>
           <br>
           <br>
           <div class="row">
              <div class ="form-group col-lg-6">
           <label>Card Number <span class="glyphicon glyphicon-credit-card"></span> :</label><input type ="text" pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" class="form-control" name="cno" placeholder="xxxx-xxxx-xxxx-xxxx" required>
              </div>         
           </div>
           <div class="row">
              <div class ="form-group col-lg-6" >
           <label>Card Holder Name:</label><input type="text" name="hName" class="form-control" required >
              </div>
           </div>
           <div class="row">
              <div class ="form-group col-lg-3">
           <label>CVV:</label><input type="text" name="cvv" id="cv" pattern="[0-9]{3}" class="form-control" width="50" required><br>
           <label>Expiry Date:</label><input type="text"  pattern="[0-9]{2}/[0-9]{2}" class="form-control" name="date" placeholder="MM/YY" required>
              </div>
           </div>
           
           <input type="submit"  value="Add Card" name="submit"  class="btn btn-primary">
         
         <script>
         if(document.getElementById('cv')!=null){
        	 document.getElementById('but1').style.background = "#C3073F";
        	
        	 
         }
         
         function showForm(clickedId)
         {(clickedId == "but2"){
        	 document.getElementById('but1').style.background = "transparent";
         }
         (clickedId == "but1"){
        	 document.getElementById('but1').style.background = "#C3073F";
         }
         }
         </script>
        </form>
      </div>     
    </div>
          
          
          
          
    <%
    ArrayList<String> cards = (ArrayList<String>)request.getAttribute("cardNos");
    %>   
    
		
		 
            
           
		

        <% String status = (String)request.getAttribute("status");
		if(status == "1"){
			%>
		<div class="container">
		<div class="gota">
		<form action="addCardServlet" method="post"   id="f3"   >     
		 <div class ="form-group col-lg-6">
		<label for="card" style="color: #C3073F !important;"><p>Select card to make payment: </p></label>
		<select id="card" name="card" class="form-control"  style="background:transparent;border-bottom: 1px solid #C3073F !important; border:none;color:white">
		<%
		for(int i = 0; i < cards.size(); i++) {
		%>  
			<option style="color:black;" id="cards" value="<%= cards.get(i) %>" class="form-control"><%= cards.get(i) %></option>
			
		<%
		}
		%>
		 
		</select>
		</div>
	
		<input type="submit" value="Select" class="btn btn-primary" name="select" id ="b3" onclick="showUp(this.id)" >
		
		</form>
		</div>
		</div>
		<script type="text/javascript">
		
		
		
		 if(document.getElementById('card')!=null){
	     document.getElementById('f1').style.display = "none";
	     document.getElementById('but2').style.background = "#C3073F";
	     
		 }
		 
		 if(clickedId == "but1"){
				document.getElementById('but1').style.background = "#C3073F";
				
			}
		 
	
         </script>
		<%
		}
		%>
		
        <% String stats = (String)request.getAttribute("stats");
		if(stats != "1"){
			%>
			<div class="container">
			<div class="gota">
		<form action="updateCardServlet" method="post" id="f2" style="display:none" >
		<c:forEach var="cardDetails" items="${cardDetails}">
          <div class="row">
              <div class ="form-group col-lg-6">
          <label>Card Type:</label><input type ="Text" value="${cardDetails.cType}" class="form-control" id="c" name="type"   style="background:transparent;"readonly>
              </div>
           </div>
            
           <div class="row">
              <div class ="form-group col-lg-6">
          <label>Card Number <span id="check"  class="glyphicon glyphicon-credit-card"></span> :</label> <input type ="text" class="form-control"  pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" name="cno" value="${cardDetails.cNum}" style="background:transparent;"  readonly>
              </div>
          </div>
          <div class="row">
              <div class ="form-group col-lg-6">
          <label>Card Holder Name:</label><input type="text" value="${cardDetails.cHName}" class="form-control" name="hName">
              </div>
           </div>
           <div class="row">
              <div class ="form-group col-lg-3" >
          <label>CVV:</label><input type="text" name="cvv" id="cvv" value="${cardDetails.cvv} " class="form-control" pattern="[]0-9]{3}">
          <label>Expiry Date:</label><input type="text" value="${cardDetails.date}" class="form-control" pattern="[0-9]{2}/[0-9]{2}" name="date" placeholder="MM/YY" >   
              </div>
           </div>
           <input type="submit" value="Update" name="update" id ="b1" class="btn btn-primary">
           <input type="submit" value="Remove Card" name="delete" id="b2" class="btn btn-danger">
           </c:forEach>
        </form>
        </div>
        </div>
        <script type="text/javascript">
        if(document.getElementById('cvv')!=null){
   	     document.getElementById('f1').style.display = "none";
   	     document.getElementById('f2').style.display = "block";
   	    document.getElementById('but2').style.background = "#C3073F";
   		 }
        
		 if(document.getElementById('c')!=null){
	     document.getElementById('f1').style.display = "none";
	     document.getElemntById('f3').style.display="block";
		 }
		 
		 
		 
        </script>
        <%} 
        %>
 
     </script>
     
           
</body>
</html>