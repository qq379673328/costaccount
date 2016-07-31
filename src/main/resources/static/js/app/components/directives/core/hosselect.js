//医院选择指令
app.directive('coreHosSelect', ["$http", function($http){
    return {
        restrict: 'A',
        replace: true,
        scope: {
        	hosid: "=hosid"
        },
        require: 'ngModel',
        templateUrl: 'js/app/components/directives/core/views/hosselect.html',
        link: function($scope, $element, attrs, ngModel) {
        	var isInit = false;
        	//选择
        	$scope.ok = function(item){
        		$scope.hosName = item.hos_name;
        		$scope.showdialog = false;
        		ngModel.$setViewValue(item);
        	};
        	//监控客户初始化
        	$scope.$watch('hosid', function(newValue, oldValue){
        		if(!newValue){
        			return;
        		}
        		if(isInit){
        			return;
        		}else{
        			isInit = true;
        			$http.post("hos/getById/" + newValue).success(function(data){
    					if(data){
    						var hos = data.data;
    						$scope.hosName = hos.hosName;
    					}
                	});
        		}
        	}, true);
        	
        	//监控查询
        	$scope.$watch('hossearch', function(newValue, oldValue){
        		if(newValue == oldValue) return;
        		$http.post("hos/list",
        				{
        				hosName: newValue,
        				page: 1, rows: 100})
        				.success(function(data){
						$scope.hoss = data.rows;
        		});
        	}, true);
        	//默认查询一次
        	$http.post("hos/list",
    				{
        			page: 1, rows: 50})
    				.success(function(data){
					$scope.hoss = data.rows;
    		});
        }
    };
}]);