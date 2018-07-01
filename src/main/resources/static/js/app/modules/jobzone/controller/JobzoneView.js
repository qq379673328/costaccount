// 区域级任务-任务详情
app.controller('JobzoneViewCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams) {
	
	$rootScope.menu = "jobzone";
	
	var jobId = $stateParams.jobId;
	
	//重新加载数据
	$scope.reload = function(){
		// 详细信息
		$http.post("jobzone/detail/" + jobId, $scope.queryParams)
		.success(function(data){
			if(data){
				$scope.job = data.detail;
				$scope.rels = data.rels;
				
				$scope.proresultZone = data.proresultZone;
				$scope.proresultCncblZone = data.proresultCncblZone;
			}
		});
	};
	
	$scope.reload();
	
});