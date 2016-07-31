//分摊算法-任务新增、编辑
app.controller('FentanJobEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, Upload, $state) {
	
	$rootScope.menu = "fentan";
	
	$scope.isRuning = false;
	
	var job = $stateParams.job || {};
	$scope.job = job;
	$scope.t_hos_id = job.t_hos_id;
	$scope.job.jobDesc = job.jobDesc || job.job_desc;
	$scope.selectHos = {
		hos_name: job.hos_name,
		id: job.t_hos_id
	};
	
	//保存
	$scope.save = function(){
		if ($scope.form.file.$valid && $scope.file) {
			$scope.job.file = $scope.file;
			$scope.job.tHosId = $scope.selectHos.id;
			$scope.job.hosName = $scope.selectHos.hos_name;
			
			$scope.isRuning = true;
			Upload.upload({
				url: 'costaccount/uploadSrcData',
				data: $scope.job
			}).then(function (resp) {
				$state.go("costaccountFentanJoblist");
			});
		}
	};
	
});