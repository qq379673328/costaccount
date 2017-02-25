//后退按钮指令
app.directive('btnBack', ["$http", function($http){
    return {
        restrict: 'E',
        replace: true,
        template:'<div class="btn btn-info" onClick="window.history.back();">&nbsp;&nbsp;返回&nbsp;&nbsp;</div>'
    };
}]);