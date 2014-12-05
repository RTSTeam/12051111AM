var adminmain = angular.module('ui.bootstrap.demo', ['ui.bootstrap', 'mgcrea.ngStrap']);


adminmain.controller("stationinsert", function($scope, $http ) {
	$scope.station = {
			stationid: "",
			stationabbrevation: "",
			stationfullname:""
  		};
	$scope.stations = [];
	$scope.welcomeMsg = null;
	$scope.canShowResult=false;
	$scope.canShow=false;
	
    var oriStation = angular.copy($scope.station);
    
    $scope.resetForm = function () {
      	$scope.station = angular.copy(oriStation);
    };
    
    $scope.isUserChanged = function () {
      	return !angular.equals($scope.station, oriStation);
    };
    
	$scope.submitData = function (station, resultVarName) {
		var params = $.param({ 	
    		stationid: station.id,
    		stationabbrevation: station.abbrevation,
    		stationfullname: station.fullname
		});
		$http({
			method: "POST",
			url: "http://localhost:8080/RTSProject/rest/insertstation",
			data: params,
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config) {
			$scope[resultVarName] = data;
			$scope.stations = data.station;
			$scope.welcomeMsg = data.msg;
		}).error(function (data, status, headers, config) {
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	};
  });
