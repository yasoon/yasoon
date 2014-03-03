define([
	'text!template/admin/adminHeader.htm',
	'view/admin/adminPage_view',
	'view/admin/interviewPage_view',
	'view/admin/timelinePage_view',
	'view/admin/usersPage',
	'view/admin/contentPage_view',
	'view/admin/adminsPageView',
	'backbone'
],function(
	headerTpl,
	mainPage,
	interviewPage,
	timelinePage,
	usersPage,
	contentPage,
	adminsPage
){

	var adminRouter = Backbone.Router.extend({

		routes: {
			'': 'adminPage',
			'interview': 'interviewPage',
			'content': 'manageContentPage',
			'users': 'usersPage',
			'timeline': 'timelinePage',
			'admins': 'adminsPage'
		},

		initialize: function(){

			this.renderHeader();
			$.get('/statistic/getCountStatistic',function(stat){ 
				window.config.siteStat = stat;
				 $.get('/api/content/get_all',function(content){ 
	                var content_arr = [];
	                _.each(content, function(cont){ content_arr[cont.id] = cont.text; });
	                window.config.content = content_arr; 
	                Backbone.history.start();
	            })
			})
			
		},

		adminPage: function(){
			this.createView( mainPage );
		},

		interviewPage: function(){
			$('header .inteviewPage').addClass('active').siblings().removeClass('active');
			if( this.interviewPageView ) this.interviewPageView.remove();
			this.interviewPageView = new interviewPage();
		},

		manageContentPage: function(){
			$('header .contentPage').addClass('active').siblings().removeClass('active');
			if( this.contentPageView ) this.contentPageView.remove();
			this.contentPageView = new contentPage();
		},

		usersPage: function(){
			$('header .usersPage').addClass('active').siblings().removeClass('active');
			config.pageType = 'users';
			if( this.usersPageView ) this.usersPageView.remove();
			this.usersPageView = new usersPage();
		},

		timelinePage: function(){
			$('header .timelinePage').addClass('active').siblings().removeClass('active');
			if( this.timelinePageView ) this.timelinePageView.remove();
			this.timelinePageView = new timelinePage();
		},

		adminsPage: function(){
			$('header .admins').addClass('active').siblings().removeClass('active');
			config.pageType = 'admins';
			if( this.adminsPageView ) this.adminsPageView.remove();
			this.adminsPageView = new adminsPage();
		},

		renderHeader: function(){
			$('header').empty().addClass('log-in').append(_.template(headerTpl));
		},

		createView: function(view){
			//this.view && this.view.remove();
			this.view = view;
		}

	});

	return adminRouter;

})