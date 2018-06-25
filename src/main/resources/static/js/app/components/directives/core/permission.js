app.directive('corePermission', ["BaseInfoService", function(BaseInfoService){
    return {
        restrict: 'A',
        link: function(scope, element, attrs, ctrl) {
        	var oldStyle = element[0].style.display;
        	//先隐藏节点
        	element[0].style.display = "none";
        	var per = attrs.corePermission;
        	BaseInfoService.getPermissions(function(permissions){
        		for(var i in permissions){
        			if(permissions[i].id == per){
        				//恢复显示
                		element[0].style.display = oldStyle;
                		break;
        			}
        		}
        	});
        	
        }
    };
}]);