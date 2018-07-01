// 密码修改
app.controller('PwdchangeCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "";
	$scope.isRuning = false;
	
	$scope.item = {};
	
	//保存
	$scope.save = function(){
		$scope.validInfo = "";
		if (!$scope.item.oldpassword) {
			$scope.validInfo = "原始密码不能为空";
			return;
		}
		if (!$scope.item.newpassword) {
			$scope.validInfo = "新密码不能为空";
			return;
		}
		if (!$scope.item.confirmpassword) {
			$scope.validInfo = "重复新密码不能为空";
			return;
		}
		if ($scope.item.newpassword != $scope.item.confirmpassword) {
			$scope.validInfo = "两次输入的新密码不一致";
			return;
		}
		
		$scope.isRuning = true;
		$http.post("api/mgr/auth/userinfo/alterPwd", $scope.item).success(function(data){
			$scope.isRuning = false;
			if(data.success == "200"){
				$state.item = {};
			}
		}).error(function(){
			$scope.isRuning = false;
		});
	}
	
});