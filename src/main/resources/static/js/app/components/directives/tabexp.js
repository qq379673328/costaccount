angular.module('tabexp', []).directive('tabexp',[function(){
    return {
        restrict: 'A',
        link: function(scope, element, attrs, ngModelCtrl){
        	var $tab = $(element);
        	var $extBtn = $("<div class='btn btn-lblue ext-btn'>导出</div>")
        		.click(function(){
        			var jsonData = [];
        			$tab.find("tr").each(function(){
    					var $tr = $(this);
    					var rowData = [];
    					$tr.find("th,td").each(function(){
    						var $thd = $(this);
    						rowData.push({
    							cols: $thd.attr("colspan") || 1,
								rows: $thd.attr("rowspan") || 1,
								val: $thd.html()
    						});
    					})
    					jsonData.push(rowData);
    				});
        			exportJsonExcel(jsonData);
        		})
        	element.before($extBtn);
        	
        	var exportJsonExcel = function(data){
        		data = JSON.stringify(data);
        		var $form = $("<form>")
        			.attr("method", "POST")
        			.attr("action", "exportSimpleTable")
        			.append("<input type='hidden' name='tableJson' value='" + data + "' />")
        			.append("<input type='hidden' name='title' value='导出' />")
        			.appendTo($("body"));
        		$form.submit();
        		$form.remove();
        	};
        }
    };
}]);