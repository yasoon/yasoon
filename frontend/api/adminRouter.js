define([
	'text!template/admin/adminHeader.htm',
	'view/admin/adminPage_view',
	'view/admin/interviewPage_view',
	'view/admin/timelinePage_view',
	'view/admin/usersPage',
	'backbone'
],function(
	headerTpl,
	mainPage,
	interviewPage,
	timelinePage,
	usersPage
){

	var adminRouter = Backbone.Router.extend({

		routes: {
			'': 'adminPage',
			'interview': 'interviewPage',
			'content': 'manageContentPage',
			'users': 'usersPage',
			'timeline': 'timelinePage'
		},

		initialize: function(){
			this.renderHeader();
			$.get('/statistic/getCountStatistic',function(stat){ window.config.siteStat = stat; })
			
		},

		adminPage: function(){
			app.view.mainPage = new mainPage();
		},

		interviewPage: function(){
			$('header .inteviewPage').addClass('active').siblings().removeClass('active');
			app.view.interviewPage = new interviewPage();
		},

		manageContentPage: function(){

		},

		usersPage: function(){
			$('header .usersPage').addClass('active').siblings().removeClass('active');
			app.view.interviewPage = new usersPage();
		},

		timelinePage: function(){
			$('header .timelinePage').addClass('active').siblings().removeClass('active');
			app.view.interviewPage = new timelinePage();
		},

		renderHeader: function(){
			$('header').empty().addClass('log-in').append(_.template(headerTpl));
		}

	});

	return adminRouter;

})