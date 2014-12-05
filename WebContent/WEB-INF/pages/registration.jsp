<!doctype html>
<html lang="en">
<head>
	<style>
	.control-group {
	    margin-left: auto;
	    margin-right: auto;
	    width: 70%;
	}
	.controls {
		width:300px;
	}
	</style>
  <meta charset="UTF-8">
  <title>Registration</title>
  

  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script>
  <script src="js/registration.js"></script>
  <link rel="stylesheet" href="css/registration.css">
  <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <!-- added -->
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!--mobile version-->
	<meta name="viewpoint" content="width=device-width, initial-scale=1.0">
	<link href = "css/bootstrap.min.css" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
  <script>
	$(document).ready(function() {
		
		$("#jQName").on("blur", function() {
			$("#userExist").hide();
			$.ajax({
				url: "http://localhost:8080/RTSProject/rest/registration/checkusernameunique",
				type: "get",
				dataType: "text",
				data: {name: $("#jQName").val()},
				async: false,
				success: function(response) {
					var result = response.toString().trim();
					if (result=="false") {
						$("#userExist").show();
						$(this).prop("invalid", true);
						$("#jSubmit").hide();
						$( "#jQName" ).css( "border", "3px solid orange" );
						//$('input[type="submit"]').attr('disabled','disabled');
						//$("#jSubmit").attr("disabled", true);
						//this.disabled = true;
					}
					else{
						$(this).prop("invalid", false);
						$( "#jQName" ).css( "border", "3px solid green" );
						//$('input[type="submit"]').removeAttr('disabled');
						$("#jSubmit").show();
					}
				},
				error: function(msg) {
					//alert(msg);
				}
			});
		});
	});	
	</script>
</head>
<body ng-app="form-example1" >
  <div ng-controller="appCtrl">
      <form name="userForm" class="form-horizontal" ng-submit="submitData(user, 'ajaxResult')" method="post" novalidate>
	 
        <div class="jumbotron">
        <div id="legend">
	      <legend class="">Register</legend>
	    </div>
        
        <!-- username -->
        <div class="control-group">
          <label class="control-label"  for="username">Username</label>
          <div class="controls">
	          <input type="text" class="form-control" ng-model="user.username" id="jQName" name="username" ng-minlength="3" ng-maxlength="10" placeholder="User ID" username required/>
	          <span class="alert" style="display:none;" id="userExist">The user already exists</span>
          </div>
        </div>
  
        <div class="control-group">
	      <!-- E-mail -->
	      <label class="control-label" for="email">E-mail</label>
	      <div class="controls">
	          <input type="email" ng-model="user.email" name="email" ng-model-options="{ updateOn: 'blur' }"  class="form-control" placeholder="Email" required />
	          <div ng-show="userForm.email.$dirty && form.email.$invalid">Invalid:
	              <span ng-show="userForm.email.$error.required">Tell us your email.</span>
	              <span ng-show="userForm.email.$error.email">This is not a valid email.</span>
	          </div>
          </div>
        </div>
      
        <div class="control-group">
	      <!-- Password-->
	      <label class="control-label" for="password">Password</label>
	      <div class="controls">
      	  	<input type="password" class="form-control" ng-model="user.password" name="password" placeholder="Password">
      	  </div>
        </div>
   
      
      <!-- Password Confirm-->
      <div class="control-group">
	      <label class="control-label" for="passwordVerify">Password Confirmation</label>
	      <div class="controls">
		  	<input type="password" class="form-control" ng-model="user.passwordVerify" name="passwordVerify" password-verify="user.password" placeholder="Type Password Again" required />
		  </div>
	  </div>
      
      <!-- Firstname -->
        <div class="control-group">
      	  
      	  <label class="control-label" for="fname">Firstname</label>
      	  <div class="controls">
      	  	<input type="text" class="form-control" ng-model="user.fname" name="fname" placeholder="First Name">
      	  </div>
        </div>
      
        <!-- Lastname -->
        <div class="control-group">
      	  
      	  <label class="control-label" for="lname">Lastname</label>
      	  <div class="controls">
      	  	<input type="text" class="form-control" ng-model="user.lname" name="lname" placeholder="Last Name">
      	  </div>
        </div>
      
      <!-- datePicker -->
        <div class="control-group" ng-controller="DatepickerDemoCtrl">
          <label class="control-label" for="lname">Birthday</label>
          <div class="controls">
           <input type="text" ng-model="user.birthday" name="birthday" class="form-control" datepicker-popup="dd-MMMM-yy" is-open="opened" min-date="1990-01-01" max-date="today" datepicker-options="dateOptions"  data-date-format="mm/dd/yyyy" placeholder="Date of Birthday" ng-required="true" close-text="Close" />
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-default" ng-click="open($event)">
                      <i class="glyphicon glyphicon-calendar"></i>
                    </button>
                  </span>
           </div>       
        </div>
        <br/>
      
      
      <!-- Button -->	
      <div class="control-group">
	      <div class="controls">
	      	<button type="button" ng-click="resetForm()" ng-disabled="!isUserChanged()">Reset</button>
		  	<button type="button"  id="jSubmit" ng-click="submitData(user, 'ajaxResult')" ng-disabled="userForm.$invalid">Submit</button>
	      	<pre>form = {{user | json}}</pre>
	      	<pre>master = {{master | json}}</pre>
	      </div>
	  </div>	
      </form>
    
      <br />
      <div ng-show="canShow">
		<h2><font color="green" id="welcome">{{welcomeMsg}}</font></h2>
		<table border="1" width="200">
			<thead>
        		<tr>
		          <th>username</th>
		          <th>first name</th>
		          <th>last name</th>
		          <th>DOB</th>
		          <th>email</th>
        		</tr>
      		</thead>
      		<tbody>
        		<tr ng-repeat="user in users">
          			<td>{{user.name}}</td>
          			<td>{{user.fname}}</td>
          			<td>{{user.lname}}</td>
          			<td>{{user.dob}}</td>
          			<td>{{user.email}}</td>
        		</tr>
      		</tbody>
		</table>
	</div>
  </div>
</body>
</html>