//项目成本计算-任务查看
app.controller('ProListViewCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams) {
	
	$rootScope.menu = "fentan";
	
	var jobId = $stateParams.jobId;
	$scope.search = {filterStr: null};
	
	//加载job信息
	$http.post("costaccount/jobDetail/" + jobId)
	.success(function(data){
		var job = data;
		$scope.job = job;
		//var hasLevelData = job.state == "2" ? true : false;
		//if(hasLevelData){
			$scope.init();
		//}
	});
	
	//重新加载分页数据
	$scope.reload = function(){
		$scope.tableParamsSrc.reload();
		$scope.tableParamsFentan.reload();
	};
	
	//初始化
	$scope.init = function(){
		
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
				$scope.queryParamsSrc.proName = $scope.search.filterStr;
				$http.post("pro/getSrcDataList", $scope.queryParamsSrc)
				.success(function(data){
					var total = data.total;
					$scope.queryParamsSrc.total = total;
					params.total(total);
					params.page($scope.queryParamsSrc.page);
					$defer.resolve(data.rows);
				});
			}
		});
		
		//分页查询-分摊数据
		$scope.queryParamsFentan = {rows: initrows, jobId: jobId};
		$scope.tableParamsFentan = new ngTableParams({
			page: initpage,
			count: initrows
		}, {
			total: 0,
			getData: function($defer, params) {
				$scope.queryParamsFentan.page = params.page();
				$scope.queryParamsFentan.rows = params.count();
				$scope.queryParamsFentan.total = params.total();
				$scope.queryParamsFentan.proName = $scope.search.filterStr;
				$http.post("pro/getResultList", $scope.queryParamsFentan)
				.success(function(data){
					var total = data.total;
					$scope.queryParamsFentan.total = total;
					params.total(total);
					params.page($scope.queryParamsFentan.page);
					$defer.resolve(data.rows);
				});
			}
		});
		
	}
	
});