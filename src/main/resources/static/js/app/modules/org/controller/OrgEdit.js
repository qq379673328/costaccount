// 机构编辑
app.controller('OrgEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "org";
	$scope.isRuning = false;
	var id = $stateParams.id;
	
	$scope.hos = {};
	
	if(id){
		//加载信息
		$http.post("org/getById/" + id)
		.success(function(data){
			$scope.org = data.data;
		});
	}
	
	//保存
	$scope.save = function(){
		$scope.isRuning = true;
		var url = id ? "org/edit" : "org/add";
		$http.post(url, $scope.org).success(function(data){
			if(data.success == '1'){
				$state.go("orgList");
			}else{
				$scope.isRuning = false;
			}
		}).error(function(){
			$scope.isRuning = false;
		});
	}
	
});