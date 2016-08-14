var fdRouterViewsBasepath = "js/app/modules/";

// 路由
app.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/index");
	$stateProvider
	// 首页
	.state('index', {
		url : "/index",
		templateUrl : fdRouterViewsBasepath + 'index/views/index.html'
	})
	// 成本核算-分摊算法-任务列表
	.state('costaccountFentanJoblist',{
		url : "/costaccount/jobList",
		templateUrl : fdRouterViewsBasepath
				+ 'costaccount/views/fentanJobList.html',
		controller : "FentanJobListCtrl"
	})
	// 成本核算-分摊算法-任务编辑
	.state('costaccountFentanJobEdit',{
		url : "/costaccount/jobEdit/{jobId}",
		params: {jobId: null},
		templateUrl : fdRouterViewsBasepath
				+ 'costaccount/views/fentanJobEdit.html',
		controller : "FentanJobEditCtrl"
	})
	// 成本核算-分摊算法-任务查看
	.state('costaccountFentanJobView',{
		url : "/costaccount/jobView/{jobId}",
		params: {jobId: null},
		templateUrl : fdRouterViewsBasepath
				+ 'costaccount/views/fentanJobView.html',
		controller : "FentanJobViewCtrl"
	})
	;
});