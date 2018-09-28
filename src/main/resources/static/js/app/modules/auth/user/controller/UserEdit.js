// 用户编辑
app.controller('UserEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "user";
	$scope.isRuning = false;
	var id = $stateParams.id;
	$scope.isAdd = id ? false : true;
	
	// 所属机构
	$http.post("org/getAll")
	.success(function(data){
		$scope.orgs = data.data;
	});
	
	if(id){
		//加载信息
		$http.post("api/mgr/auth/usermgr/detail/" + id)
		.success(function(data){
			$scope.item = data;
		});
	}else{
		$scope.item = {};
	}
	
	//保存
	$scope.save = function(){
		if ($scope.isAdd && !$scope.item.loginName) {
			$scope.validInfo = "账号不能为空";
			return;
		}
		
		if (!$scope.item.name) {
			$scope.validInfo = "姓名不能为空";
			return;
		}
		
		if (!$scope.item.orgId) {
		debugger;
			$scope.validInfo = "所属机构不能为空";
			return;
		}
		
		$scope.isRuning = true;
		var url = id ? "api/mgr/auth/usermgr/edit" : "api/mgr/auth/usermgr/add";
		$http.post(url, $scope.item).success(function(data){
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