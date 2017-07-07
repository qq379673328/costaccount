var fdRouterViewsBasepath = "js/app/modules/";

// 路由
app.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/costaccount/jobList");
	$stateProvider
	// 首页
	.state('index', {
		url : "/index",
		templateUrl : fdRouterViewsBasepath + 'index/views/index.html'
	})
	// 成本核算-分摊算法-任务创建
	.state('costaccountFentanJoblist',{
		url : "/costaccount/jobList",
		templateUrl : fdRouterViewsBasepath
				+ 'costaccount/views/fentanJobList.html',
		controller : "FentanJobListCtrl"
	})
	// 成本核算-分摊算法-结果查看
	.state('costaccountFentanJoblistView',{
		url : "/costaccount/jobListview",
		params: {type: 'view'},
		templateUrl : fdRouterViewsBasepath
				+ 'costaccount/views/fentanJobListView.html',
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
	
	// 成本核算-项目算法-数据上传
	.state('proUpload',{
		url : "/proUpload/{jobId}",
		params: {jobId: null},
		templateUrl : fdRouterViewsBasepath
				+ 'pro/views/proUpload.html',
		controller : "ProUploadCtrl"
	})
	// 成本核算-项目算法-查看
	.state('proListView',{
		url : "/pro/view/{jobId}",
		params: {jobId: null},
		templateUrl : fdRouterViewsBasepath
				+ 'pro/views/proListView.html',
		controller : "ProListViewCtrl"
	})
	
	// 医院列表
	.state('hosList',{
		url : "/hos/list",
		templateUrl : fdRouterViewsBasepath
				+ 'hos/views/list.html',
		controller : "HosListCtrl"
	})
	// 医院编辑
	.state('hosEdit',{
		url : "/hos/edit/{hosId}",
		params: {hosId: null},
		templateUrl : fdRouterViewsBasepath
				+ 'hos/views/edit.html',
		controller : "HosEditCtrl"
	})
	// 医院新增
	.state('hosAdd',{
		url : "/hos/add",
		templateUrl : fdRouterViewsBasepath
				+ 'hos/views/edit.html',
		controller : "HosEditCtrl"
	})
	
	// 科室列表
	.state('deptList',{
		url : "/dept/list/{hosId}",
		templateUrl : fdRouterViewsBasepath
				+ 'dept/views/list.html',
		controller : "DeptListCtrl"
	})
	// 科室编辑
	.state('deptEdit',{
		url : "/dept/edit/{hosId}/{deptId}",
		templateUrl : fdRouterViewsBasepath
				+ 'dept/views/edit.html',
		controller : "DeptEditCtrl"
	})
	// 科室新增
	.state('deptAdd',{
		url : "/dept/add/{hosId}",
		templateUrl : fdRouterViewsBasepath
				+ 'dept/views/edit.html',
		controller : "DeptEditCtrl"
	})
	
	// 项目字典列表
	.state('prodicList',{
		url : "/prodic/list/{hosId}",
		templateUrl : fdRouterViewsBasepath
				+ 'prodic/views/list.html',
		controller : "ProdicListCtrl"
	})
	// 项目字典编辑
	.state('prodicEdit',{
		url : "/prodic/edit/{hosId}/{prodicId}",
		templateUrl : fdRouterViewsBasepath
				+ 'prodic/views/edit.html',
		controller : "ProdicEditCtrl"
	})
	// 项目字典新增
	.state('prodicAdd',{
		url : "/prodic/add/{hosId}",
		templateUrl : fdRouterViewsBasepath
				+ 'prodic/views/edit.html',
		controller : "ProdicEditCtrl"
	})
	;
});