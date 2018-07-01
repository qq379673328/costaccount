// 用户列表
app.controller('UserListCtrl',function($scope,
		$http, ngTableParams, $rootScope, $stateParams, Upload) {
	
	$rootScope.menu = "user";
	
	//分页查询
	var initpage = 1,
		initrows = 10;
	$scope.search = {};
	
	$scope.queryParams = {rows: initrows};
	$scope.initParams = function(pageNotChange){
		var iPage = initpage;
		if(pageNotChange){
			iPage = $scope.queryParams.page;
		}
		var temp = {
				page: iPage,
				rows: $scope.queryParams.rows,
				isreload: true
			};
		angular.extend(temp, $scope.search);
		angular.extend($scope.queryParams, temp);
	};
	$scope.initParams();
	/*重新加载*/
	$scope.reload = function(pageNotChange){
		$scope.initParams(pageNotChange);
		$scope.tableParams.reload();
	};
	$scope.tableParams = new ngTableParams({
		page: initpage,
		count: initrows
	}, {
		total: 0,
		getData: function($defer, params) {
			if(!$scope.queryParams.isreload){
				$scope.queryParams.page = params.page();
				$scope.queryParams.rows = params.count();
				$scope.queryParams.total = params.total();
			}else{
				$scope.queryParams.isreload = false;
			}
			$http.post("api/mgr/auth/usermgr/list", $scope.queryParams).success(function(data){
				var total = data.total;
				$scope.queryParams.total = total;
				params.total(total);
				params.page($scope.queryParams.page);
				$defer.resolve(data.rows);
			});
		}
	});

	//监控查询条件
	$scope.$watch('search', function(newValue, oldValue){
		if(newValue == oldValue) return;
		$scope.reload();
	}, true);
	
	// 禁用
	$scope.disable = function(item){
		item.ishanding = true;
		$http.post("api/mgr/auth/usermgr/disable", {id: item.id}).success(function(data){
			$scope.reload();
		}).error(function(){
			item.ishanding = false;
		});
	};
	
	// 启用
	$scope.enable = function(item){
		item.ishanding = true;
		$http.post("api/mgr/auth/usermgr/enable", {id: item.id}).success(function(data){
			$scope.reload();
		}).error(function(){
			item.ishanding = false;
		});
	};
	
	// 重置密码
	$scope.resetPwd = function(item){
		item.ishanding = true;
		$http.post("api/mgr/auth/usermgr/resetPwd", {ids: item.id}).success(function(data){
			$scope.reload();
		}).error(function(){
			item.ishanding = false;
		});
	};

});