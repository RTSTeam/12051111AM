<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app="ui.bootstrap.demo">
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="js/main.js"></script>
    <!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet"> -->
	
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.tpl.min.js"></script>
	
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    
    <!-- credit card css -->
    <link rel="stylesheet" href="css/creditcard.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script>
  </head>
  <body>

<div ng-controller="SearchCtrl">
  <nav>
		
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
				<p class="navbar-brand" href="">Hello, ${userid}</p>
			</div>
			
			<div id="navbar" class="navbar-collapse collapse">
				<form class="navbar-form navbar-right" role="form">
					<a type="button" class="btn btn-primary" href="<c:url value='/j_spring_security_logout'/>">Logout</a>
				</form>
			</div>
		</div>
	</nav>
  <tabset>
    
    <tab heading="Search">
    <form name="userForm" class="css-form" ng-submit="submitData(user, 'ajaxResult')" novalidate>
		<div ng-show="false" class="row">
			<div class="col-md-2">
				<input id="onewayRadio" type="radio" ng-model="user.tripType" value="One Way"><label for="onewayRadio">One Way</label>
			</div>
			<div class="col-md-2">
				<input id="roundtripRadio" type="radio" ng-model="user.tripType" value="Round Trip" /><label for="roundtripRadio">Round Trip</label>
			</div>		 
		</div>
		
		<p></p>
		<div class="controls">
			<label for="departureStationSel">From:</label>
			<select class="form-control" id="departureStationSel" ng-model="user.departureStationValue" ng-options="departureStation for departureStation in departureStationArray">
			</select>
		</div>
		<div class="controls">
			<label for="arrivalStationSel">To:&nbsp; &nbsp; &nbsp;</label>
			<select class="form-control" id="arrivalStationSel" ng-model="user.arrivalStationValue" ng-options="arrivalStation for arrivalStation in arrivalStationArray">
			</select>
		</div>
		<br />
		<div class="controls">
			<label class="control-label"><i class="fa fa-calendar"></i> Departure Time:</label><br>
			<div class="form-group">
				<input type="text" size="10" class="form-control" ng-model="user.departureDate" data-autoclose="1" placeholder="Date" bs-datepicker>
			</div>
			<div class="form-group" class="col-md-2">
				<input type="text" size="8" class="form-control" ng-model="user.departureTime" data-autoclose="1" placeholder="Time" bs-timepicker>
			</div>
		</div>
		<div class="padding">
			<div class="row">
				<div class="col-md-1"><strong>Adults:</strong></div>
				<div class="col-md-1"><strong>Seniors:</strong></div>
				<div class="col-md-1"><strong>Children:</strong></div>
			</div>
		</div>
		<div class="padding">
			<div class="row">
				<div class="col-md-1"><input class="form-control" type="number" min="0" max="10" value="{{user.adultsValue}}" ng-model="user.adultsValue"/></div>
				<div class="col-md-1"><input class="form-control" type="number" min="0" max="10" value="{{user.seniorsValue}}" ng-model="user.seniorsValue"/></div>
				<div class="col-md-1"><input class="form-control" type="number" min="0" max="10" value="{{user.childrenValue}}" ng-model="user.childrenValue"/></div>
			</div>
		</div>
		<br />
		<div class="controls">
			<div class="row">
				<!-- <div class="col-md-2">&nbsp; &nbsp;<button type="button" class="btn btn-warning" ng-click="resetForm()">Reset</button></div> -->
				<div class="col-md-4"><button type="submit" class="btn btn-success" ng-disabled="userForm.$invalid">Find Trains</button></div>
			</div>
		</div>
		<pre>form = {{user | json}}</pre>
	</form>
	<div ng-show="canShow">
		<table table class="table table-hover">
			<thead>
        		<tr>
        			<th>Ticket ID</th>
		            <th>From</th>
		            <th>To</th>
		            <th>Departure Time</th>
		            <th>Arrival Time</th>
		            <th>Price</th>
		            <th></th>
        		</tr>
      		</thead>
      		<tbody>
        		<tr ng-repeat="ticket in tickets">
        			<td>{{ticket.ticketID}}</td>
          		    <td>{{ticket.departureStationName}}</td>
          			<td>{{ticket.arrivalStationName}}</td>
          			<td>{{ticket.departureYear}}-{{ticket.departureMonth}}-{{ticket.departureDay}}&nbsp;{{ticket.departureHour}}:{{ticket.departureMinute}}</td>
          			<td>{{ticket.arrivalYear}}-{{ticket.arrivalMonth}}-{{ticket.arrivalDay}}&nbsp;{{ticket.arrivalHour}}:{{ticket.arrivalMinute}}</td>
          			<td>{{(user.adultsValue + user.seniorsValue + user.childrenValue) * ticket.price}} Dollars</td>
          			<td>
          				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Buy</button>
						<div ng-controller="MainCtrl" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    	<div class="modal-dialog">
					    		<div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							        <h4 class="modal-title" id="myModalLabel">Enter Credit Card Information:</h4>
							      </div>
							      <div class="modal-body">
							      	<form novalidate name="paymentForm" ng-controller="MainCtrl">
									    <input
									      class="form-control"
									      type="text"
									      name="creditCard"
									      ng-model="ccinfo.number"
									      required
									      data-credit-card-type
									      data-ng-pattern="/^[0-9]+$/"
									      data-ng-minlength="15"
										  ng-model-options="{ updateOn: 'blur' }" 
									      luhn-check
										  maxlength="19"
									      placeholder="Card Number" >{{ccinfo.type}}
											  <span ng-show="paymentForm.creditCard.$error.pattern">Credit card must consist of only numbers</span>
											  <span ng-show="paymentForm.creditCard.$error.minlength">Credit card must be 15-19 digits</span>
											  <span ng-show="paymentForm.creditCard.$error.invalid">Credit card must be a valid Amex, Visa, Discover, or Master Card</span>
											  <span ng-show="paymentForm.creditCard.$error['luhn-check']" class='error'>Error: failed Luhn check</span>
											  <span ng-show="paymentForm.creditCard.required && paymentForm.creditCard.$pristine">Credit Card number required</span>
										<br/>
									    <input
									      class="form-control"
									      type="text"
									      name="securityCode"
									      ng-model="ccinfo.securityCode"
									      placeholder="CCV"
									      required
									      data-ng-pattern="/^[0-9]+$/"
									      data-ng-minlength="3"
									      maxlength="4">
									    
									    <div ng-show="paymentForm.submitAttempt && !paymentForm.$valid">
										  <div ng-show="myForm.number.$error['luhn-check']" class='error'>Invalid card number</div>	
									      <div ng-show="paymentForm.securityCode.$error.pattern">Security code must contain only numbers</div>
									      <div ng-show="paymentForm.securityCode.$error.minlength">Security code must be 3-4 digits</div>
									      <div ng-show="paymentForm.securityCode.$error.required">Security code required</div>
									    </div>
										
										<br/>
										<div class="widthcontrols">
										    <select class="form-control" ng-model="ccinfo.month" name="month" data-card-expiration required>
										      <option disabled selected value="">Month</option>
										      <option ng-repeat="month in months" value="{{$index+1}}" > {{$index+1}} - {{month}}</li>
										    </select>
									    </div>
									    <br/>
									    <ul ng-show="paymentForm.submitAttempt && !paymentForm.$valid">
									      <li ng-show="paymentForm.month.$error.required">Expiration month required</li>
									    </ul>
									    <div class="widthcontrols">
										    <select class="form-control" ng-model="ccinfo.year" name="year" required>
										      <option disabled selected value="">Year</option>
										      <option ng-repeat="year in [] | range:currentYear:currentYear+13">{{year}}</li>
										    </select>
									    </div>
									    <br/>
									    <ul ng-show="paymentForm.submitAttempt && !paymentForm.$valid">
									      <li ng-show="paymentForm.year.$error.required">Expiration year required</li>
									      <li ng-show="paymentForm.month.$error.invalid">Provided expiration date is invalid</li>
									    </ul>
									
									  </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" ng-click='hideShow()' data-dismiss="modal">Close</button>
							        <button type="button" class="btn btn-primary" ng-click="hideShow(); checkout('${userid}',ticket, 'ajaxResult')" data-dismiss="modal">Confirmed</button>
							      </div>
					    		</div>
					  		</div>
					    </div>
					</td>
					
        		</tr>
      		</tbody>
		</table>
	</div>
	</tab>
	
	<!-- Transaction History -->
	<tab heading="Transaction History" ng-click="getTransactionData('${userid}', 'ajaxResult')">
		<div ng-show="canShow">
			<table border="2" width="600" class="table table-hover">
				<thead>
	        		<tr>
			          	<th>Transaction ID</th>
			            <th>Ticket ID</th>
			            <th>Price</th>
			            <th>Quantity</th>
			            <th>Reservation Number</th>
	        		</tr>
	      		</thead>
	      		<tbody>
	        		<tr ng-repeat="transaction in transactions">
	          			<td>{{transaction.tranID}}</td>
	          			<td>{{transaction.ticketID}}</td>
	          			<td>{{transaction.price}}</td>
	          			<td>{{transaction.qyt}}</td>
	          			<td>{{transaction.reservation}}</td>
	        		</tr>
	      		</tbody>
			</table>
		</div> 
	</tab>
	
	<!-- Personal Information -->
	<tab heading="Personal Information" ng-click="getPersonInfoData('${userid}', 'ajaxResult')">
		<div ng-show="canShow">
			<table border="2" width="600" class="table table-hover">
				<thead>
	        		<tr>
			          <th>Username</th>
			          <th>First name</th>
			          <th>Last name</th>
			          <th>Email</th>
			          <th>Birthday</th>
	        		</tr>
	      		</thead>
	      		<tbody>
	        		<tr ng-repeat="personinfo in personinfos">
	          			<td>{{personinfo.userID}}</td>
	          			<td>{{personinfo.fname}}</td>
	          			<td>{{personinfo.lname}}</td>
	          			<td>{{personinfo.email}}</td>
	          			<td>{{personinfo.birthday}}</td>
	        		</tr>
	      		</tbody>
			</table>
		</div> 
	</tab>

  </tabset>
   
</div>

</body>
</html>
