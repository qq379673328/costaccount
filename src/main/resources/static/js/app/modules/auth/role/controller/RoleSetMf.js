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
		var items = (data && data.length > 0) ? data[0].children : [];
		
		$scope.items = items;
		
	});
	
	// 分配权限
	$scope.setMf = function(){
		$scope.isRuning = true;
		
		var ids = [];
		
		for(var i in $scope.items){
			var item = $scope.items[i];
			if(item.checked){
				ids.push(item.id);
			}
			
			var lv2Items = item.children || [];
			for(var i in lv2Items){
				var itemLv2 = lv2Items[i];
				if(itemLv2.checked){
					ids.push(itemLv2.id);
				}
				
				var lv3Items = itemLv2.children || [];
				for(var i in lv3Items){
					var itemLv3 = lv3Items[i];
					if(itemLv3.checked){
						ids.push(itemLv3.id);
					}
					
				}
				
			}
			
		}
		
		$http.post("api/mgr/auth/rolemgr/setPerms", {roleId: id, ids: ids.join("&")}).success(function(data){
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