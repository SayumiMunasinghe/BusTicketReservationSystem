<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

<div class="container">
  <h2>Agency Registration</h2>
  <form class="form-horizontal" action="agencyInsert" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Agent Name:</label>
      <div class="col-sm-9">
        <input type="text" name="agentName" placeholder="Enter name" class="form-control">
     </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">agent NIC:</label>
      <div class="col-sm-9">
 		<input type="text" name="agentNIC" value="John" class="form-control">
      </div>
      </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">companyName:</label>
      <div class="col-sm-9">
        <input type="text" name="companyName" value="Doe" class="form-control">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">agentPhone:</label>
      <div class="col-sm-9">
          <input type="text" name="agentPhone" value="John" class="form-control">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">agentEmail:</label>
      <div class="col-sm-9">
        <input type="email" name="agentEmail" value="Doedwww@gmail.com" class="form-control" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">agencyLocation:</label>
      <div class="col-sm-9">
         <input type="text" name="agencyLocation" value="Doe" class="form-control">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">password:</label>
      <div class="col-sm-9">
        <input type="password"  name="password" value="Doe" class="form-control" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">confirmPassword:</label>
      <div class="col-sm-9">
        <input type="password" name="confirmPassword" value="Dssssoe" class="form-control" required>
      </div>
    </div>
       <div class="form-group">
      <label class="control-label col-sm-2" for="email">userName:</label>
      <div class="col-sm-9">
        <input type="text" name="userName" placeholder="Enter username" class="form-control" required>
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" name="submit" value="Register" class="btn btn-default">

      </div>
    </div>
  </form>
</div>

</body>
</html>



