//分摊算法-任务查看
app.controller('FentanJobViewCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams) {
	
	$rootScope.menu = "fentan";
	
	var job = $stateParams.job,
		jobId = job.id,
		hasLevelData = job.state == "2" ? true : false;
	$scope.job = job;
	
	var initpage = 1,
		initrows = 100;
	//分页查询-原始数据
	$scope.queryParamsSrc = {rows: initrows, jobId: jobId};
	$scope.tableParamsSrc = new ngTableParams({
		page: initpage,
		count: initrows
	}, {
		total: 0,
		getData: function($defer, params) {
			$scope.queryParamsSrc.page = params.page();
			$scope.queryParamsSrc.rows = params.count();
			$scope.queryParamsSrc.total = params.total();
			$http.post("costaccount/getSrcDataList", $scope.queryParamsSrc)
			.success(function(data){
				var total = data.total;
				$scope.queryParamsSrc.total = total;
				params.total(total);
				params.page($scope.queryParamsSrc.page);
				$defer.resolve(data.rows);
			});
		}
	});
	
	//分页查询-一级分摊
	if(hasLevelData){
		$scope.queryParamsLevel1 = {rows: initrows, jobId: jobId, level: 1};
		$scope.tableParamsLevel1 = new ngTableParams({
			page: initpage,
			count: initrows
		}, {
			total: 0,
			getData: function($defer, params) {
				$scope.queryParamsLevel1.page = params.page();
				$scope.queryParamsLevel1.rows = params.count();
				$scope.queryParamsLevel1.total = params.total();
				$http.post("costaccount/getFentanList", $scope.queryParamsLevel1)
				.success(function(data){
					var total = data.total;
					$scope.queryParamsLevel1.total = total;
					params.total(total);
					params.page($scope.queryParamsLevel1.page);
					$defer.resolve(data.rows);
				});
			}
		});
	}
	
	//分页查询-二级分摊
	if(hasLevelData){
		$scope.queryParamsLevel2 = {rows: initrows, jobId: jobId, level: 2};
		$scope.tableParamsLevel2 = new ngTableParams({
			page: initpage,
			count: initrows
		}, {
			total: 0,
			getData: function($defer, params) {
				$scope.queryParamsLevel2.page = params.page();
				$scope.queryParamsLevel2.rows = params.count();
				$scope.queryParamsLevel2.total = params.total();
				$http.post("costaccount/getFentanList", $scope.queryParamsLevel2)
				.success(function(data){
					var total = data.total;
					$scope.queryParamsLevel2.total = total;
					params.total(total);
					params.page($scope.queryParamsLevel2.page);
					$defer.resolve(data.rows);
				});
			}
		});
	}
	
	//分页查询-三级分摊
	if(hasLevelData){
		$scope.queryParamsLevel3 = {rows: initrows, jobId: jobId, level: 3};
		$scope.tableParamsLevel3 = new ngTableParams({
			page: initpage,
			count: initrows
		}, {
			total: 0,
			getData: function($defer, params) {
				$scope.queryParamsLevel3.page = params.page();
				$scope.queryParamsLevel3.rows = params.count();
				$scope.queryParamsLevel3.total = params.total();
				$http.post("costaccount/getFentanList", $scope.queryParamsLevel3)
				.success(function(data){
					var total = data.total;
					$scope.queryParamsLevel3.total = total;
					params.total(total);
					params.page($scope.queryParamsLevel3.page);
					$defer.resolve(data.rows);
				});
			}
		});
	}
	
});