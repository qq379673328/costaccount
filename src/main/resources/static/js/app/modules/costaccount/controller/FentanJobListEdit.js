//分摊算法-任务新增、编辑
app.controller('FentanJobEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, Upload, $state) {
	
	$rootScope.menu = "fentan";
	
	$scope.isRuning = false;
	
	var jobId = $stateParams.jobId;
	
	$scope.job = {
		type: '年'
	}
	
	// 年份
	var years = [];
	var currentYear = new Date().getFullYear();
	for(var i = 0; i < 5; i++){
		years.push(currentYear - i);
	}
	$scope.years = years;
	
	//加载job信息
	if(jobId){
		$http.post("costaccount/jobDetail/" + jobId)
		.success(function(data){
			var job = data;
			$scope.job = job;
			$scope.t_hos_id = job.t_hos_id;
			$scope.job.jobDesc = job.jobDesc || job.job_desc;
			
			$scope.selectHos = {
				hos_name: job.hos_name,
				id: job.t_hos_id
			};
		});
	}
	
	//保存
	$scope.save = function(){
		$scope.validInfo = "";
		if (!$scope.job.year) {
			$scope.validInfo = "请选择年份";
			return;
		}
		if (!$scope.selectHos || !$scope.selectHos.id) {
			$scope.validInfo = "请选择医院";
			return;
		}
		if (!$scope.form.file.$valid || !$scope.file) {
			$scope.validInfo = "请选择需要上传的文件";
			return;
		}
		
		if ($scope.form.file.$valid && $scope.file) {
			$scope.job.file = $scope.file;
			$scope.job.tHosId = $scope.selectHos.id;
			$scope.job.hosName = $scope.selectHos.hos_name;
			
			$scope.isRuning = true;
			Upload.upload({
				url: 'costaccount/uploadSrcData',
				data: $scope.job
			}).then(function (resp) {
				if(resp && resp.data && resp.data.success == "1"){
					$state.go("costaccountFentanJoblist");
				}
				$scope.isRuning = false;
			});
		}
	};
	
});