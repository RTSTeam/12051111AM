<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html >
  <head>
	<link href = "css/adminmain.css" rel="stylesheet">
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
  	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
  </head>


<body >
<div ng-app="ui.bootstrap.demo">
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
	
	<!-- First Part -->
	<!-- Personal Information --> 
	<tab heading="Personal Information" ng-controller="AdminInfo" ng-click="getPersonInfoData('${userid}', 'ajaxResult')">
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
	
	<!-- Second Part -->
    <tab heading="Station Information" ng-controller="Station" ng-click="findAllStation()" >
		<!--  <form name="tracmodify" class="form-inline" id="stationDiv1" role="form">
			<div class="form-group" ng-show="canShowResult">
				<h2><font color="green" id="welcome">Station List</font></h2>
				<table border="1" width="200">
					<thead>
        				<tr>
		          			<th>Station Abbreviation</th>
		          			<th>Station Full Name</th>
        				</tr>
      				</thead>
      				
	      			<tbody>
	        			<tr ng-repeat="station in stations">
	          				<td>{{station.stationAbbr}}</td>
	          				<td>{{station.stationFullName}}</td>
	        			</tr>
	      			</tbody>
				</table>
			</div>	  
		</form>-->
		<form name="tracmodify" class="form-inline" id="stationDiv1" role="form">
			Search: <input ng-model="searchText" ng-click="findAllStation()">
			<table id="searchTextResults">
			  <tr><th>Station Abbr</th><th>Station FullName</th></tr>
			  <tr ng-repeat="station in stations | filter:searchText">
			    <td>{{station.stationAbbr}}</td>
			    <td>{{station.stationFullName}}</td>
			  </tr>
			</table>
			<!-- <hr>
			Any: <input ng-model="search.$"> <br>
			Name only <input ng-model="search.name"><br>
			Phone only <input ng-model="search.phone"><br>
			Equality <input type="checkbox" ng-model="strict"><br>
			<table id="searchObjResults">
			  <tr><th>Name</th><th>Phone</th></tr>
			  <tr ng-repeat="friendObj in friends | filter:search:strict">
			    <td>{{friendObj.name}}</td>
			    <td>{{friendObj.phone}}</td>
			  </tr>
			</table> -->
		</form>
		
		<form name="insertform" class="form-inline" id="stationDiv2" role="form" >
			<h2><font color="green" id="welcome">Please Insert A New</font></h2>
			<div class="form-group" >
      			<form name="userForm" class="css-form"  ng-submit="submitData(station, 'ajaxResult')" novalidate>

	        		<div>
	          			<input type="input" ng-model="station.abbrevation" name="stationabbrevation" placeholder="Station Abbrevation" required>
	        		</div>
      
	        		<div>
	      	  			<input type="input" ng-model="station.fullname" name="stationfullname" placeholder="Station Full Name" required>
	        		</div>
		 
		      	<button type="button" ng-click="resetForm()" ng-disabled="!isUserChanged()">Reset</button>
			  	<button type="button" ng-click="submitData(station, 'ajaxResult')" ng-disabled="userForm.$invalid">Submit</button>
	      		</form>
			</div>
			
			<div ng-show=canShowNewResult>
				<h2><font color="green" id="stationDiv2">You inserted a new station!</font></h2>
				
			</div>
		</form>	
	</tab>	
	
	<!-- Third Part -->
    <tab heading="Ticket Information" ng-controller="Ticket" >
		<div class="row">
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="onewayRadio" type="radio" ng-model="ticketOption" value="finaallforqty" ng-change="findAllQty()"><label for="findall">Change ticket qty</label>
			</div>
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="roundtripRadio" type="radio" ng-model="ticketOption" value="add" ng-change="queryAllStation()"/><label for="add">Add ticket info</label>
			</div>		 
		</div>
		
		<form name="tracmodify" class="form-inline" role="form" ng-show="ticketOption == 'finaallforqty'">
			<div class="form-group" ng-show="canShowResult">
				<h2><font color="green" id="welcome">Add available tickets</font></h2>
					<table border="2" class="table table-hover">
						<thead>
							<tr>
								<th>Ticket ID</th>
								<th>Total Quantity</th>
								<th>Available Quantity</th>
								<th>New Total Quantity</th>
								<th>New Available Quantity</th>
								<th>Change Quantity</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="ticketqty in ticketqtys">
								<td>{{ticketqty.ticketID}}</td>
								<td>{{ticketqty.totalQty}}</td>
								<td>{{ticketqty.avaiQty}}</td>
								<td><input type="number" ng-model="newticket.totalqty" placeholder="New Total Quantity" required></td>
								<td><input type="number" ng-model="newticket.availqty" placeholder="New Available Quantity" required></td>
								<td>
									<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModalUpdateQTY" ng-click="updateQty(ticketqty.ticketID, newticket, 'ajaxResult')">
									Change
									</button>
									<div class="control-group">
									<div class="controls">
										<div class="modal fade" id="myModalUpdateQTY" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									    	<div class="modal-dialog">
									    		<div class="modal-content">
											        <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
											        <h4 class="modal-title" id="myModalLabel">Your request will be processed in 1 minute.</h4>
											     
											        <button type="button" class="btn btn-default" ng-clilck="$window.close()" data-dismiss="modal">Close</button>
											        <button type="button" class="btn btn-default"><a href="http://localhost:8080/RTSProject/adminmain.html">Go back</a></button>
											      
									    			</div>
									  			</div>
									    	</div>
										</div>
									</div>
									</div>
								</td>		
							</tr>
						</tbody>
					</table>
			</div>	  
		</form>
		
		 
		<form name="insertform" class="form-inline" role="form" ng-show="ticketOption == 'add'" >
			Please insert new information of ticket<br/>
			
			<div class="form-group" >
      			<form name="userForm" class="css-form" ng-submit="submitNewData(ticket, 'ajaxResult')" novalidate>
					<p></p>
					<div class="controls">
						<label for="departureStationSel">From:</label> <select
							class="form-control" id="departureStationSel"
							ng-model="ticket.departureStationValue"
							ng-options="departureStation.stationFullName for departureStation in stationArray">
						</select>
					</div>
					<div class="controls">
						<label for="arrivalStationSel">To:&nbsp; &nbsp; &nbsp;</label> <select
							class="form-control" id="arrivalStationSel"
							ng-model="ticket.arrivalStationValue"
							ng-options="arrivalStation.stationFullName for arrivalStation in stationArray">
						</select>
					</div>
					<br />
					
					<div class="controls">
						<label class="control-label"><i class="fa fa-calendar"></i>
							Departure Time:</label><br>
						<div class="form-group">
							<input type="text" size="10" class="form-control"
								ng-model="ticket.departureDate" data-autoclose="1"
								placeholder="Date" bs-datepicker>
						</div>
						<div class="form-group" class="col-md-2">
							<input type="text" size="8" class="form-control"
								ng-model="ticket.departureTime" data-autoclose="1"
								placeholder="Time" bs-timepicker>
						</div>
					</div>
					<br />
					
					<div class="controls">
						<label class="control-label"><i class="fa fa-calendar"></i>
							Arrival Time:</label><br>
						<div class="form-group">
							<input type="text" size="10" class="form-control"
								ng-model="ticket.arrivalDate" data-autoclose="1"
								placeholder="Date" bs-datepicker>
						</div>
						<div class="form-group" class="col-md-2">
							<input type="text" size="8" class="form-control"
								ng-model="ticket.arrivalTime" data-autoclose="1"
								placeholder="Time" bs-timepicker>
						</div>
					</div>
					<br />
					
					<div class="controls">
						<label class="control-label">Price</label><br>
						<div class="form-group">
							<input type="number" ng-model="ticket.price" placeholder="Price" required>
							<span class="error" ng-show="myForm.input.$error.required">
							    Required!</span>
							<span class="error" ng-show="myForm.input.$error.number">
							    Not valid number!</span>
						</div>
					</div>
					<br />
					
					<div class="controls">
						<label class="control-label">Total Quantity</label><br>
						<div class="form-group">
							<input type="number" ng-model="ticket.totalqty" placeholder="Total Quantity" required>
							<span class="error" ng-show="myForm.input.$error.required">
							    Required!</span>
							<span class="error" ng-show="myForm.input.$error.number">
							    Not valid number!</span>
						</div>
					</div>
					<br />
					
					<div class="controls">
						<label class="control-label">Available Quantity</label><br>
						<div class="form-group">
							<input type="number" ng-model="ticket.avalqty" placeholder="Available Quantity" required>
							<span class="error" ng-show="myForm.input.$error.required">
							    Required!</span>
							<span class="error" ng-show="myForm.input.$error.number">
							    Not valid number!</span>
						</div>
					</div>
					<br />
					<pre>form = {{ticket | json}}</pre>
					<button type="button" ng-click="resetForm()" ng-disabled="!isUserChanged()">Reset</button>
			  		<button type="button" ng-click="submitData(ticket, 'ajaxResult');resetForm()" ng-disabled="ticket.$invalid">Submit</button>
				</form>
			</div>
			
			
			<div ng-show=canShowNewResult>
				<h2><font color="green" id="welcome">You inserted a new ticket!</font></h2>
			</div>
		</form>
	</tab>
		
	<!-- Fourth Part -->
	<tab heading="Refund" ng-controller="Refund" ng-click="getRefundingData('ajaxResult')">
		<table border="2" class="table table-hover">
				<thead>
					<tr>
						<th>Transaction ID</th>
						<th>Ticket ID</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Transaction Type</th>
						<th>Refund Ticket</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="transaction in transactions">
						<td>{{transaction.tranID}}</td>
						<td>{{transaction.ticketID}}</td>
						<td>{{transaction.price}}</td>
						<td>{{transaction.qty}}</td>
						<td>{{transaction.tranType}}</td>
						<td>
							<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModalDoRefund" ng-click="returnRefund(transaction.tranID, 'ajaxResult')">
							Refund
							</button>
							<div class="control-group">
							<div class="controls">
								<div class="modal fade" id="myModalDoRefund" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							    	<div class="modal-dialog">
							    		<div class="modal-content">
									        <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									        <h4 class="modal-title" id="myModalLabel">Your request will be processed in 1 minute.</h4>
									     
									        <button type="button" class="btn btn-default" ng-clilck="$window.close()" data-dismiss="modal">Close</button>
									        <button type="button" class="btn btn-default"><a href="http://localhost:8080/RTSProject/adminmain.html">Go back</a></button>
									      
							    			</div>
							  			</div>
							    	</div>
								</div>
							</div>
							</div>
						</td>		
					</tr>
				</tbody>
			</table>
	</tab>
	
  </tabset>

</div>

</body>
</html>
