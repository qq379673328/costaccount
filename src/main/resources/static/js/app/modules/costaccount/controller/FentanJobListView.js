//分摊算法-任务查看
app.controller('FentanJobViewCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams) {
	
	$rootScope.menu = "fentan";
	
	var jobId = $stateParams.jobId;
	$scope.queryParams = {deptName: null};
	
	//重新加载数据
	$scope.reload = function(){
		// 详细信息
		$http.post("costaccount/getHandleData/" + jobId, $scope.queryParams)
		.success(function(data){
			if(data){
				$scope.job = data.job;
				$scope.hos = data.hos;
				$scope.dataBase = data.base;
				$scope.dataSrc = data.src;
				$scope.dataSrcKdgzl = data.srcKdgzl;
				$scope.dataSrcNls = data.srcNls;
				$scope.dataFentan = data.fentan;
				$scope.procosts = data.proresult;
				
				handleCncbl(data.proresultCncbl)
				$scope.proresultCncbl = data.proresultCncbl;
				
				// 将原始数据中部分数据放入分摊数据中
				if(data.fentan && data.src){
					for(var i = 0; i < data.fentan.length; i++){
						var fentanItem = data.fentan[i];
						for(var j = 0; j < data.src.length; j++){
							var srcItem = data.src[j];
							if(fentanItem.dept_code == srcItem.dept_code){
								angular.extend(fentanItem, srcItem);
								continue;
							}
						}
					}
				}
				
			}
		});
	};
	
	$scope.reload();
	
	// 过滤器
	$scope.filterL1 = function(item){
		return item.dept_type_code=='LC' || item.dept_type_code=='YJ' || item.dept_type_code=='YF' ? true : false;
	}
	$scope.filterL2 = function(item){
		return item.dept_type_code=='LC' || item.dept_type_code=='YJ' ? true : false;
	}
	$scope.filterL3 = function(item){
		return item.dept_type_code=='LC' ? true : false;
	}
	
	function handleCncbl(items){
		if(items){
			for(var i in items){
				items[i].type = getCncblType(items[i].type);
			}
		}
	}
	
	function getCncblType(type){
		if(type == 1) return '直接成本';
		if(type == 2) return '业务成本';
		if(type == 3) return '全成本';
		return '';
	}
	
	
	
});