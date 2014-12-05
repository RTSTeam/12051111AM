<!doctype html>
<html ng-app="ui.bootstrap.demo">
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="search.js"></script>
    <!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet"> -->
	
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.tpl.min.js"></script>
	
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	<!--
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/angular-motion.min.css">
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/bootstrap-additions.min.css">
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/libraries.min.css">
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/main.min.css">
	-->
  </head>
  <body>

<div ng-controller="SearchCtrl">
  <br />
  <div>
  &nbsp; &nbsp; Hello, Guanyi.
  </div>
  <hr />

  <tabset>
    <tab heading="Personal Information">
		<p>Justified content</p>
	</tab>
    <tab heading="Search">
		<div class="row">
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="onewayRadio" type="radio" ng-model="tripType" value="One Way" /><label for="onewayRadio">One Way</label>
			</div>
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="roundtripRadio" type="radio" ng-model="tripType" value="Round Trip" /><label for="roundtripRadio">Round Trip</label>
			</div>		 
		</div>
		<div>
			<p>&nbsp; &nbsp; Selected trip:{{tripType}}</p>   
		</div>
		<div class="row">
			<div class="col-md-2">
				&nbsp; &nbsp; <label for="departureStationSel">From:</label>
				<select id="departureStationSel" ng-model="departureStationValue" ng-options="departureStation for departureStation in departureStationArray">
				</select>
			</div>
			<div class="col-md-2">
				&nbsp; &nbsp; <label for="arrivalStationSel">To:</label>
				<select id="arrivalStationSel" ng-model="arrivalStationValue" ng-options="arrivalStation for arrivalStation in arrivalStationArray">
				</select>
			</div>
		</div>
		<div>
			<p>&nbsp; &nbsp; Selected Departure: {{departureStationValue}}</p>
			<p>&nbsp; &nbsp; Selected Arrival: {{arrivalStationValue}}</p>
		</div>
		<form name="timepickerForm" class="form-inline" role="form">
			<!-- Datetime example -->
			<div class="form-group">
				&nbsp; &nbsp; <label class="control-label"><i class="fa fa-calendar"></i> Departure Time:</label><br>
				<div class="form-group">
					&nbsp; &nbsp; <input type="text" size="10" class="form-control" ng-model="sharedDate" data-autoclose="1" placeholder="Date" bs-datepicker>
				</div>
				<div class="form-group" class="col-md-2">
					<input type="text" size="8" class="form-control" ng-model="sharedDate" data-autoclose="1" placeholder="Time" bs-timepicker>
				</div>
			</div>
		</form>
		
		<br />
		<div class="row">
			<div class="col-md-1">&nbsp; &nbsp;<strong>Adults:</strong></div>
			<div class="col-md-1"><strong>Seniors:</strong></div>
			<div class="col-md-1"><strong>Children:</strong></div>
		</div>
		<div class="row">
			<div class="col-md-1">&nbsp; &nbsp;<input type="number" min="0" max="10" value="{{adultsValue}}" ng-model="adultsValue"/></div>
			<div class="col-md-1"><input type="number" min="0" max="10" value="{{seniorsValue}}" ng-model="seniorsValue"/></div>
			<div class="col-md-1"><input type="number" min="0" max="10" value="{{childrenValue}}" ng-model="childrenValue"/></div>
		</div>
		
		<br />
		<div class="row">
			<div class="col-md-2">&nbsp; &nbsp;<button type="button" class="btn btn-warning" ng-click="resetForm()">Reset</button></div>
			<div class="col-md-2"><button type="submit" class="btn btn-success"ng-disabled="userForm.$invalid">Submit</button></div>
		</div>
		
	</tab>
    <tab heading="History">
		<p>History</p>
	</tab>
  </tabset>
  
  
  
  
  
</div>


  </body>
</html>
