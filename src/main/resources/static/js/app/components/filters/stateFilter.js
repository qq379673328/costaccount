
app.filter('state', function () {
    return function (input) {
    	if(input == "2"){
    		return "分析成功";
    	}else if(input == "0"){
    		return "未处理";
    	}else if(input == "1"){
    		return "分析中";
    	}else if(input == "9"){
    		return "分析失败";
    	}
    };
});