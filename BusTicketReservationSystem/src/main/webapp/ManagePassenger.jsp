<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 20%;
  height: 350px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 2px solid #ccc;
  width: 50%;
  border-left: none;
  height: 350px;
}

.big{
	margin-left: 200px;
	margin-top: 100px;
}

.border{
	  	padding: 20px 35px 20px 35px;
	  	border-radius: 25px;
	 	background-color: #f5f5f5;
	 	width: 1000px;
	 	margin: auto;
}
.container{
		   width: auto;	
}

</style>

</head>
	
	<%
     if("${userID}" == null || "${mode}" == null){ %>
	     <script>
			window.location.href = 'PassengrLogin.jsp';
		</script>
     <%}
%>

<body>

<br><br>
<br><br>
<h4 style="margin-left: 200px;">Hi <strong>(put her person name)</strong>,</h4>
<h2 style="margin-left: 200px; margin-bottom: -100px;">Settings</h2>


<div class="big" style="">
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'Pwd')" id="defaultOpen">Password</button>
  <button class="tablinks" onclick="openCity(event, 'telno')">Contact Number</button>
  <button class="tablinks" onclick="openCity(event, 'delete')">Delete Account</button>
</div>

<div id="Pwd" class="tabcontent" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(247, 247, 247, 0.95) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">
  <div class="container" id="form1">
  <h3>Password</h3>
  <!-- this form is to update the password -->
  <form action="#" method="post">
  
  <div class="form-group">
      <label for="pwd1">Password:</label>
      <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password" onkeyup='check();' />
    </div>
    <div class="form-group">
      <label for="pwd2">Confirm Password:</label>
      <input type="password"  class="form-control" name="conpwd" id="conpwd" placeholder="Re-enter password" onkeyup='check();' /> 
  		<span id='message'></span>
    </div>
    
    <input type="submit" class="btn btn-warning" value="Update">
  
  </form>
</div>
</div>

<div id="telno" class="tabcontent" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(247, 247, 247, 0.95) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">
  <div class="container" id="form2">
  
  <h3>Contact Number</h3>
  <!-- this form is to update telephone number -->
  
  <form class="form-inline" action="#" method="post">
    <div class="form-group">
      <label for="email">Phone:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter contact number" name="email">
    </div>
    
    <input type="submit" class="btn btn-warning" value="Update">
  </form>
  </div>
</div> 


<div id="delete" class="tabcontent" style="background-image: linear-gradient(to bottom, rgba(247, 247, 247, 0.95) 0%,rgba(237, 133, 135, 0.75) 0%), url(https://dbdzm869oupei.cloudfront.net/img/sticker/preview/28839.png)">
  <h3>Delete My Account</h3>
   <div class="alert alert-danger">
    <strong>Warning!</strong> Once your account is delete this action cannot be reversed.
  </div>
  
   <form action="ManagePassengerDetailsServlets" method="post">
   		<input type="button" class="btn btn-danger" name="delete" value="Delete My Account"> 
   </form> 
</div>


</div>

<script>
     var check = function() {
        if (document.getElementById('pwd').value != document.getElementById('conpwd').value) {
          document.getElementById('message').style.color = 'red';
          document.getElementById('message').innerHTML = 'Not Matching!';
        }else{
          document.getElementById('message').style.display = "none";
        }
	}

function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
   
</body>
</html> 
