//科室编辑
app.controller('DeptEditCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, $state) {
	
	$rootScope.menu = "hos";
	$scope.isRuning = false;
	var id = $stateParams.deptId;
	var hosId = $stateParams.hosId;
	
	$scope.dept = {};
	
	var dics = {
		deptType: [
		["XZHQ", "行政后勤"],
		["YJ", "医技"],
		["YF", "医辅"],
		["LC", "临床"]
		],
		deptSpe: [
		["REGISTER", "挂号收费处"],
		["OUTPATIENT", "门诊科室"],
		["SUPPLY", "供应室科室"],
		["INHOS", "住院科室"],
		["CASHIER", "住院收费处"],
		["MEDICALRECORD", "病案室科室"]
		]
	};
	$scope.dics = dics;
	
	if(id){
		//加载科室信息
		$http.post("dept/getById/" + id)
		.success(function(data){
			$scope.dept = data.data;
		});
	}
	
	//保存
	$scope.save = function(){
		$scope.isRuning = true;
		var url = id ? "dept/edit" : "dept/add";
		$scope.dept.tHospitalId = hosId;
		handleCode();
		$http.post(url, $scope.dept).success(function(data){
			$state.go("deptList", {hosId: hosId});
		}).error(function(){
			$scope.isRuning = false;
		});
	}
	
	// 处理编码
	function handleCode(){
		if($scope.dept){
			$scope.dept.deptTypeName = getCodeDesc("deptType", $scope.dept.deptTypeCode);
			$scope.dept.deptSpecialName = getCodeDesc("deptSpe", $scope.dept.deptSpecialCode);
		}
	}
	
	// 获取码值描述
	function getCodeDesc(type, code){
		var ret = "";
		for(var i in dics[type]){
			var item = dics[type][i];
			if(item[0] == code){
				ret = item[1];
				break;
			}
		}
		return ret;
	}
	
});