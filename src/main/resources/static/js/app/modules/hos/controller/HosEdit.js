//医院编辑
app.controller('HosEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "hos";
	$scope.isRuning = false;
	var id = $stateParams.hosId;
	
	$scope.hos = {};
	
	if(id){
		//加载医院信息
		$http.post("hos/getById/" + id)
		.success(function(data){
			$scope.hos = data.data;
		});
	}
	
	//保存
	$scope.save = function(){
		$scope.isRuning = true;
		var url = id ? "hos/edit" : "hos/add";
		$http.post(url, $scope.hos).success(function(data){
			$state.go("hosList");
		}).error(function(){
			$scope.isRuning = false;
		});
	}
	
});