// 角色分配权限
app.controller('RoleSetMfCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "role";
	$scope.isRuning = false;
	var id = $stateParams.id;
	$scope.inParams = $stateParams;
	$scope.params = {};

	//加载信息
	$http.get("api/mgr/auth/rolemgr/getPermsAll?roleId="+id)
	.success(function(data){
		$scope.items = (data && data.length > 0) ? data[0].children : [];
	});
	
	// 分配权限
	$scope.setRole = function(){
		$scope.isRuning = true;
		
		var roleIds = [];
		for(var i in $scope.roles){
			var role = $scope.roles[i];
			if(role.checked){
				roleIds.push(role.ID)
			}
		}
		
		$http.post("api/mgr/auth/usermgr/setRole", {userId: id, roleIds: roleIds.join("&")}).success(function(data){
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