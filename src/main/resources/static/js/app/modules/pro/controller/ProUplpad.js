// 项目理论成本数据上传
app.controller('ProUploadCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, Upload, $state) {
	
	$rootScope.menu = "fentan";
	
	$scope.isRuning = false;
	
	var jobId = $stateParams.jobId;
	$scope.pro = {};
	
	//保存
	$scope.save = function(){
		if ($scope.form.file.$valid && $scope.file) {
			$scope.pro.file = $scope.file;
			$scope.pro.jobId = jobId;
			
			$scope.isRuning = true;
			Upload.upload({
				url: 'pro/uploadSrcData',
				data: $scope.pro
			}).then(function (resp) {
				$state.go("costaccountFentanJoblist");
			});
		}
	};
	
});