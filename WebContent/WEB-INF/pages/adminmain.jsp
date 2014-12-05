<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html >
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script>
    <script src="js/adminmain.js"></script>
    <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.tpl.min.js"></script>
	
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
  </head>

<body >

<div ng-app="ui.bootstrap.demo">
  <br />
  <div>
  &nbsp; &nbsp; Hello, Guanyi.
  
  <a href="<c:url value='/j_spring_security_logout'/>">Logout</a>
  </div>
  <hr />

  <tabset>
    <tab heading="User Information">
		<p>Justified content</p>
	</tab>
    <tab heading="Transaction Information">
		
		
	</tab>
	<!-- Third part -->
    <tab heading="Ticket Information">
		<div class="row">
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="onewayRadio" type="radio" ng-model="transaction" value="modify"><label for="modify">modify</label>
			</div>
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="roundtripRadio" type="radio" ng-model="transaction" value="add" /><label for="add">add</label>
			</div>		 
		</div>
		
		<form name="tracmodify" class="form-inline" role="form" ng-show="transaction == 'modify'">
			<div class="form-group">
				Modify Transaction
			</div>
		</form>
		
		<div ng-controller="stationinsert"> 
		<form name="insertform" class="form-inline" role="form" ng-show="transaction == 'add'" >
			Please insert a new station
			<div class="form-group" >
      			<form name="userForm" class="css-form"  ng-submit="submitData(station, 'ajaxResult')" novalidate>
        			<div>
          				<input type="input" ng-model="station.id" name="stationid" placeholder="Station ID" required>
        			</div>
  
	        		<div>
	          			<input type="input" ng-model="station.abbrevation" name="stationabbrevation" placeholder="Station Abbrevation" required>
	        		</div>
      
	        		<div>
	      	  			<input type="input" ng-model="station.fullname" name="stationfullname" placeholder="Station Full Name" required>
	        		</div>
		 
		      	<button type="button" ng-click="resetForm()" ng-disabled="!isUserChanged()">Reset</button>
			  	<button type="button" ng-click="submitData(station, 'ajaxResult')" ng-disabled="userForm.$invalid">Submit</button>
	      		<!-- 
	      		<pre>form = {{user | json}}</pre>
	      		<pre>master = {{master | json}}</pre>
	      	 	-->  
	      		</form>
			</div>
		</form>
		</div>
		
	</tab>
  </tabset>

</div>

</body>
</html>
