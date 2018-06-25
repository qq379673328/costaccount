app.factory('BaseInfoService', ["$http", "ngTableParams", 
    function($http, ngTableParams) {
	var permissions = null;
	
	return {
		//获取登录用户权限信息
		getPermissions: function(cb){
			if(permissions){
				cb(permissions);
			}else{
				$http.post("api/mgr/auth/usermgr/getMyPermissions").success(function(data){
					permissions = data;
					if(cb) cb(permissions);
				});
			}
		},
		//进行分页查询
		pageSearch: function(sc){
			var $scope = sc["$scope"],
				p = sc["params"],
				url = sc["url"],
				page = sc["page"];
			//每页默认数
			if(page == undefined){
				page = 10;
			}
			var items = sc["items"];
			if(!p){
				$scope[p] = {};
			}
			
			var ret = new ngTableParams({
				page: 0,
				count: page
			}, {
				total: 0,
				getData: function($defer, params) {
					if(!$scope[p].isreload){
						$scope[p].page = params.page();
						$scope[p].rows = params.count();
						$scope[p].total = params.total();
					}else{
						$scope[p].isreload = false;
					}
					$http.post(url, $scope[p]).success(function(data){
						var total = data.total;
						$scope[p].total = total;
						params.total(total);
						$defer.resolve(data.rows);
					});
				}
			});
			return ret;
		}
		
	};
}]);