//分摊算法-任务详情
app.controller('FentanJobViewCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams) {
	
	$rootScope.menu = "fentanView";
	
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
				
				var srcNlsMap = {};
				for(var i in data.srcNls){
					srcNlsMap[data.srcNls[i].dept_code] = true;
				}
				
				// 根据年例数过滤结果集（只显示科室开展项目）
				var dataFentan = [];
				if(data.srcNls && data.fentan){
					for(var i in data.fentan){
						if(srcNlsMap[data.fentan[i].dept_code] || data.fentan[i].level == 2){
							dataFentan.push(data.fentan[i]);
						}
					}
				}
				$scope.dataFentan = dataFentan;
				
				// 根据年例数过滤结果集（只显示科室开展项目）
				var proCosts = [];
				if(data.srcNls && data.proresult){
					for(var i in data.proresult){
						if(srcNlsMap[data.proresult[i].dept_code] || data.proresult[i].level == 2){
							proCosts.push(data.proresult[i]);
						}
					}
				}
				$scope.procosts = proCosts;
				
				// 对比数据
				var deptDb = {};
				var yuanDb = {};
				for(var i in proCosts){
					var item = proCosts[i];
					var level = item.level;//1,2
					var type = item.type;// 1,2,3
					var proCode = item.pro_code;
					var proName = item.pro_name;
					
					if(level == 1){// dept
						var deptCode = item.dept_code;
						var deptName = item.dept_name;
						var bzDeptCode = item.bz_dept_code;
						var bzDeptName = item.bz_dept_name;
						var key = deptCode + "__" + proCode;
						if(!deptDb[key]){
							deptDb[key] = {'dept_code': deptCode, 'dept_name': deptName, 'bz_dept_code': bzDeptCode, 'bz_dept_name': bzDeptName, 'pro_code': proCode, 'pro_name': proName};
						}
						if(type == 1){
							deptDb[key].a = item.cost_people_direct + item.cost_house_direct + item.cost_spe_direct 
								+ item.cost_asset_direct + item.cost_other_direct 
								+ item.cost_wsclf + item.cost_ylfxjj 
								+ item.cost_people_mid_all + item.cost_house_mid_all + item.cost_spe_mid_all
								+ item.cost_asset_mid_all + item.cost_other_mid_all;
						}else if(type == 2){
							deptDb[key].b = item.cost_people_direct + item.cost_house_direct + item.cost_spe_direct 
								+ item.cost_asset_direct + item.cost_other_direct 
								+ item.cost_wsclf + item.cost_ylfxjj 
								+ item.cost_people_mid_all + item.cost_house_mid_all + item.cost_spe_mid_all
								+ item.cost_asset_mid_all + item.cost_other_mid_all;
						}else if(type == 3){
							deptDb[key].c = item.cost_people_direct + item.cost_house_direct + item.cost_spe_direct 
								+ item.cost_asset_direct + item.cost_other_direct 
								+ item.cost_wsclf + item.cost_ylfxjj;
						}
					}else if(level == 2){// yuan
						var hosCode = data.hos.hosCode;
						var hosName = data.hos.hosName;
						var key = hosCode + "__" + proCode;
						if(!yuanDb[key]){
							yuanDb[key] = {hosCode: hosCode, hosName: hosName, 'pro_code': proCode, 'pro_name': proName};
						}
						if(type == 1){
							yuanDb[key].a = item.cost_people_direct + item.cost_house_direct + item.cost_spe_direct 
								+ item.cost_asset_direct + item.cost_other_direct 
								+ item.cost_wsclf + item.cost_ylfxjj 
								+ item.cost_people_mid_all + item.cost_house_mid_all + item.cost_spe_mid_all
								+ item.cost_asset_mid_all + item.cost_other_mid_all;
						}else if(type == 2){
							yuanDb[key].b = item.cost_people_direct + item.cost_house_direct + item.cost_spe_direct 
								+ item.cost_asset_direct + item.cost_other_direct 
								+ item.cost_wsclf + item.cost_ylfxjj 
								+ item.cost_people_mid_all + item.cost_house_mid_all + item.cost_spe_mid_all
								+ item.cost_asset_mid_all + item.cost_other_mid_all;
						}else if(type == 3){
							yuanDb[key].c = item.cost_people_direct + item.cost_house_direct + item.cost_spe_direct 
								+ item.cost_asset_direct + item.cost_other_direct 
								+ item.cost_wsclf + item.cost_ylfxjj;
						}
					}
				
				}
				var deptDbArr = [];
				var yuanDbArr = [];
				for(var key in deptDb){
					deptDbArr.push(deptDb[key]);
				}
				for(var key in yuanDb){
					yuanDbArr.push(yuanDb[key]);
				}
				$scope.deptDb = deptDbArr;
				$scope.yuanDb = yuanDbArr;
				
				handleCncbl(data.proresultCncbl);
				
				// 根据年例数过滤结果集（只显示科室开展项目）
				var proresultCncbl = [];
				if(data.srcNls && data.proresultCncbl){
					for(var i in data.proresultCncbl){
						if(srcNlsMap[data.proresultCncbl[i].dept_code]){
							proresultCncbl.push(data.proresultCncbl[i]);
						}
					}
				}
				$scope.proresultCncbl = proresultCncbl;
				
				$scope.proresultZone = data.proresultZone;
				$scope.proresultCncblZone = data.proresultCncblZone;
				
				// 将原始数据里面空数据替换为0
				for(var i in data.src){
					var srcRow = data.src[i];
					for(var key in srcRow){
						if(!srcRow[key]){
							srcRow[key] = 0;
						}
					}
				}
				
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