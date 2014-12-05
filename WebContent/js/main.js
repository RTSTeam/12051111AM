var app = angular.module('ui.bootstrap.demo', ['ui.bootstrap', 'mgcrea.ngStrap']);
app.controller('SearchCtrl', function ($scope, $window, $http) {
	$scope.tabs = [
	               { title:'Dynamic Title 1', content:'Dynamic content 1' },
	               { title:'Dynamic Title 2', content:'Dynamic content 2', disabled: true }
	               ];

	$scope.departureStationArray = [
	                                "Boston, MA - South Station (BOS)", 
	                                "Framingham, MA (FRA)",
	                                "Providence, RI (PVD)",
	                                "Westwood - Route 128, MA", 
	                                "Worcester, MA (WOR)"
	                                ];

	$scope.arrivalStationArray = [
	                              "Boston, MA - South Station (BOS)", 
	                              "Framingham, MA (FRA)",
	                              "Providence, RI (PVD)",
	                              "Westwood - Route 128, MA", 
	                              "Worcester, MA (WOR)"
	                              ];

	// Radio button
	//$scope.tripType = 'One Way';

	$scope.user = {
			tripType: "One Way",
			departureStationValue: "",
			arrivalStationValue: "",
			departureDate: "",
			departureTime:"",
			adultsValue: 1,
			seniorsValue: 0,
			childrenValue: 0
	};

	$scope.tickets = [];
	$scope.canShow = false;
	
	$scope.hideShow = function(){
		$scope.canShow = false;
	};
	
	//	core function
	$scope.submitData = function (ticket, resultVarName) {
		var params = $.param({ 	
			tripType: ticket.tripType,
			departureStationValue: ticket.departureStationValue,
			arrivalStationValue: ticket.arrivalStationValue,
			departureDate: ticket.departureDate,
			departureTime: ticket.departureTime,
			adultsValue: ticket.adultsValue,
			seniorsValue: ticket.seniorsValue,
			childrenValue: ticket.childrenValue
		});
		$http({
			method: "POST",
			url: "http://localhost:8080/RTSProject/rest/search",
			data: params,
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config) {
			$scope[resultVarName] = data;
			if(angular.isArray(data.ticket)){
				$scope.tickets = data.ticket;
				$scope.canShow = true;
			} else if(data.ticket==null){
				$scope.canShow = false;
			}
			else{
				$scope.tickets[0]=data.ticket;
				$scope.canShow = true;
			}
			//$scope.users = data.user;

		}).error(function (data, status, headers, config) {
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	};

	// Transactions
	$scope.transactions = [];
	$scope.getTransactionData = function (useridinput, resultVarName) {
		var params = $.param({ 	
			userid: useridinput
		});
		$http({
			method: "POST",
			url: "http://localhost:8080/RTSProject/rest/usertransaction",
			data: params,
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config) {
			$scope[resultVarName] = data;

			if(angular.isArray(data.transaction)){
				$scope.transactions = data.transaction;
			}

			else{
				$scope.transactions[0]=data.transaction;
			}

			//$scope.transactions = data.transaction;
			$scope.canShow = true;
		}).error(function (data, status, headers, config) {
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	};
	//Personal information
	$scope.personinfos = [];
	$scope.getPersonInfoData = function(useridinput, resultVarName) {
		var params = $.param({ 	
			userID: useridinput
		});
		$http({
			method: "POST",
			url: "http://localhost:8080/RTSProject/rest/userpersoninfo",
			data: params,
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config) {
			$scope[resultVarName] = data;
			
			if(angular.isArray(data.personinfo)){
				$scope.personinfos = data.personinfo;
			}
			
			else{
				$scope.personinfos[0]=data.personinfo;
			}

			$scope.canShow = true;
		}).error(function (data, status, headers, config) {
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	};
	
	// Checkout
	$scope.checkouts = [];
	$scope.checkout = function (userid, ticket, resultVarName) {
		var params = $.param({ 	
			userid: userid,
			ticketid: ticket.ticketID,
			price: ticket.price,
			qty: ticket.qty,
		});
		$http({
			method: "POST",
			url: "http://localhost:8080/RTSProject/rest/checkout",
			data: params,
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config) {
			$scope[resultVarName] = data;
			if(angular.isArray(data.checkout)){
				$scope.checkouts = data.checkout;
			} else if(data.checkout==null){
			}
			else{
				$scope.checkouts[0]=data.checkout;
			}

		}).error(function (data, status, headers, config) {
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	};


	$scope.getAlert = function () {
		$window.alert("hi");
	};
});
var luhnChk = function(cc) {
	// digits 0-9 doubled with nines cast out
	var doubled = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9];

	// remove non-digit characters
	cc = cc.replace(/[^\d]/g, '');
	var digits = cc.split('');

	// alternate between summing the digits
	// or the result of doubling the digits and
	// casting out nines (see Luhn description)
	var alt = false;
	var total = 0;
	while (digits.length)
	{
		var d = Number(digits.pop());
		total += (alt ? doubled[d] : d);
		alt = !alt;
	}
	return total % 10 == 0;
};

app.controller
( 'MainCtrl'
		, function($scope,$locale) {
			$scope.currentYear = new Date().getFullYear();
			$scope.currentMonth = new Date().getMonth() + 1;
			$scope.months = $locale.DATETIME_FORMATS.MONTH;
			$scope.ccinfo = {type:undefined};
			$scope.save = function(data){
				if ($scope.paymentForm.$valid){
					console.log(data); // valid data saving stuff here
				}
			};
			$scope.ccinfo = {
					month: "",
					year: ""
			};
		}
);


app.directive
( 'cardExpiration'
		, function(){
			var directive =
			{ require: 'ngModel'
				, link: function(scope, elm, attrs, ctrl){
					scope.$watch('[ccinfo.month,ccinfo.year]',function(value){
						ctrl.$setValidity('invalid',true);
						if ( scope.ccinfo.year == scope.currentYear
								&& scope.ccinfo.month <= scope.currentMonth
						) {
							ctrl.$setValidity('invalid',false);
						}
						return value;
					},true);
				}
			};
			return directive;
		}
);

app.filter
( 'range'
		, function() {
			var filter = 
				function(arr, lower, upper) {
				for (var i = lower; i <= upper; i++) arr.push(i);
				return arr;
			};
			return filter;
		}
);

app.directive('luhnCheck', function() {
	return {
		restrict: 'A',
		require: 'ngModel',
		link: function(scope, element, attributes, ngModel) {

			function luhnCheck(value) {
				ngModel.$setValidity('luhn-check', luhnChk(value));
				return value;
			}

			ngModel.$parsers.push(luhnCheck);
			ngModel.$formatters.push(luhnCheck);
		}

	};
});


