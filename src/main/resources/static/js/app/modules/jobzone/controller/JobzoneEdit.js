// 区域级任务-任务新增、编辑
app.controller('JobzoneEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, Upload, $state) {
	
	$rootScope.menu = "jobzone";
	
	$scope.isRuning = false;
	
	$scope.items = [];
	
	$scope.jd = {
		jobDesc: null
	};
	
	// 年份
	var years = [];
	var currentYear = new Date().getFullYear();
	for(var i = 0; i < 5; i++){
		years.push(currentYear - i);
	}
	$scope.years = years;
	
	$scope.job = {
		type: '年',
		year: currentYear,
	}
	// 刷新任务
	$scope.refresh = function(){
		// 详细信息
		$http.post("costaccount/getSpeJobList", {
			year: $scope.job.year,
			type: $scope.job.type == '年' ? '年' : '半年',
			halfType: $scope.job.type != '年' ? $scope.job.type : null
		})
		.success(function(data){
			$scope.items = data;
		});
	}
	
	//监控查询条件
	$scope.$watch('job', function(newValue, oldValue){
		if(newValue == oldValue) return;
		$scope.refresh();
	}, true);
	
	$scope.refresh();
	
	
	//保存
	$scope.save = function(){
		$scope.validInfo = "";
		if (!$scope.jd.jobDesc) {
			$scope.validInfo = "请输入描述";
			return;
		}
		
		// 选择的任务
		var ids = [];
		for(var i in $scope.items){
			var item = $scope.items[i];
			if(item.checked){
				ids.push(item.id);
			}
		}
		if(ids.length == 0){
			$scope.validInfo = "请至少选择一个任务";
			return;
		}
		
			
		$scope.isRuning = true;
		$http.post("jobzone/add", {desc: $scope.jd.jobDesc, ids: ids.join("&")}).success(function(data){
			$state.go("jobzonelist");
		}).error(function(){
			$scope.isRuning = false;
		});
	};
	
});