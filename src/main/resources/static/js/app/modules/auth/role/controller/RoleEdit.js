// 角色编辑
app.controller('RoleEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "role";
	$scope.isRuning = false;
	var id = $stateParams.id;
	$scope.isAdd = id ? false : true;
	if(id){
		//加载信息
		$http.post("api/mgr/auth/rolemgr/detail/" + id)
		.success(function(data){
			$scope.item = data;
		});
	}else{
		$scope.item = {};
	}
	
	//保存
	$scope.save = function(){
		
		if (!$scope.item.roleName) {
			$scope.validInfo = "角色名不能为空";
			return;
		}
		
		$scope.isRuning = true;
		$http.post("api/mgr/auth/rolemgr/edit", $scope.item).success(function(data){
			if(data.success == "200"){
				$state.go("roleList");
			}else{
				$scope.isRuning = false;
			}
		}).error(function(){
			$scope.isRuning = false;
		});
	}
	
});