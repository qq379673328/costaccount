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
				
				// 对比数据
				var quDb = {};
				for(var i in data.proresultZone){
					var item = data.proresultZone[i];
					var type = item.type;// 1,2,3
					var proCode = item.pro_code;
					var proName = item.pro_name;
					
					var key = proCode;
					if(!quDb[key]){
						quDb[key] = {'pro_code': proCode, 'pro_name': proName};
					}
					if(type == 1){
						quDb[key].a =  item.cost_people + item.cost_house + item.cost_spe
							+ item.cost_asset + item.cost_other
							+ item.cost_wsclf + item.cost_ylfxjj ;
					}else if(type == 2){
						quDb[key].b = item.cost_people + item.cost_house + item.cost_spe
							+ item.cost_asset + item.cost_other
							+ item.cost_wsclf + item.cost_ylfxjj ;
					}else if(type == 3){
						quDb[key].c = item.cost_people + item.cost_house + item.cost_spe
							+ item.cost_asset + item.cost_other
							+ item.cost_wsclf + item.cost_ylfxjj ;
					}
				
				}
				var quDbArr = [];
				for(var key in quDb){
					quDbArr.push(quDb[key]);
				}
				$scope.quDb = quDbArr;
				
			}
		});
	};
	
	$scope.reload();
	
});