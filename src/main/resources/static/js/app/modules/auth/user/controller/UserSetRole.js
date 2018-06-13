// 用户分配角色
app.controller('UserSetRoleCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "user";
	$scope.isRuning = false;
	var id = $stateParams.id;
	$scope.inParams = $stateParams;
	$scope.params = {};
	
	//加载信息
	$http.get("api/mgr/auth/rolemgr/getRolesByUserId?userId="+id)
	.success(function(data){
		
		if(data){
			for(var i in data){
				var item = data[i];
				if(item.isown == '1'){
					item.checked = true;
				}
			}
		}
		
		$scope.roles = data;
	});
	
	// 分配角色
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
				$state.go("userList");
			}else{
				$scope.isRuning = false;
			}
		}).error(function(){
			$scope.isRuning = false;
		});
	}
	
});