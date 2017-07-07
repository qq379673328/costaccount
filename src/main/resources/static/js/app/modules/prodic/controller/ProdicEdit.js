//项目字典编辑
app.controller('ProdicEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "pro";
	$scope.isRuning = false;
	var id = $stateParams.prodicId;
	var hosId = $stateParams.hosId;
	
	$scope.prodic = {};
	
	if(id){
		//加载信息
		$http.post("prodic/getById/" + id)
		.success(function(data){
			$scope.prodic = data.data;
		});
	}
	
	//保存
	$scope.save = function(){
		
		if (!$scope.prodic.proCode) {
			$scope.validInfo = "项目编码不能为空";
			return;
		}
		if (!$scope.prodic.proName) {
			$scope.validInfo = "项目名称不能为空";
			return;
		}
		
		$scope.isRuning = true;
		var url = id ? "prodic/edit" : "prodic/add";
		$scope.prodic.tHospitalId = hosId;
		$http.post(url, $scope.prodic).success(function(data){
			$state.go("prodicList", {hosId: hosId});
		}).error(function(){
			$scope.isRuning = false;
		});
	}
	
});