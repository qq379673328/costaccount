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
	
	// 区域级任务-任务创建
	.state('jobzonelist',{
		url : "/costaccount/jobzoneList",
		templateUrl : fdRouterViewsBasepath
				+ 'jobzone/views/jobzoneList.html',
		controller : "JobzoneListCtrl"
	})
	// 区域级任务-结果查看
	.state('jobzoneView',{
		url : "/costaccount/jobzoneview/{jobId}",
		params: {jobId: null},
		templateUrl : fdRouterViewsBasepath
				+ 'jobzone/views/jobzoneView.html',
		controller : "JobzoneViewCtrl"
	})
	// 区域级任务-任务编辑
	.state('jobzoneEdit',{
		url : "/costaccount/jobzoneEdit/{jobId}",
		params: {jobId: null},
		templateUrl : fdRouterViewsBasepath
				+ 'jobzone/views/jobzoneEdit.html',
		controller : "JobzoneEditCtrl"
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
	
	// 用户列表
	.state('userList',{
		url : "/user/list",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/user/views/list.html',
		controller : "UserListCtrl"
	})
	// 用户编辑
	.state('userEdit',{
		url : "/user/edit/{id}",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/user/views/edit.html',
		controller : "UserEditCtrl"
	})
	// 用户新增
	.state('userAdd',{
		url : "/user/add",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/user/views/edit.html',
		controller : "UserEditCtrl"
	})
	// 用户角色分配
	.state('userSetRole',{
		url : "/user/setrole?id&loginName",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/user/views/setrole.html',
		controller : "UserSetRoleCtrl"
	})
	
	// 角色列表
	.state('roleList',{
		url : "/role/list",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/role/views/list.html',
		controller : "RoleListCtrl"
	})
	// 角色编辑
	.state('roleEdit',{
		url : "/role/edit/{id}",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/role/views/edit.html',
		controller : "RoleEditCtrl"
	})
	// 角色新增
	.state('roleAdd',{
		url : "/role/add",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/role/views/edit.html',
		controller : "RoleEditCtrl"
	})
	// 角色分配权限
	.state('roleSetMf',{
		url : "/role/setmf?id&roleName",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/role/views/setmf.html',
		controller : "RoleSetMfCtrl"
	})
	// 密码修改
	.state('pwdchange',{
		url : "/pwdchange",
		templateUrl : fdRouterViewsBasepath
				+ 'auth/user/views/pwdchange.html',
		controller : "PwdchangeCtrl"
	})
	
	;
});