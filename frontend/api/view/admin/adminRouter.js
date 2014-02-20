define([
	'backbone'
],function(){

	var adminRouter = Backbone.Router.extend({

		routes: {
			'admin/interview': 'interviewPage',
			'admin/stats': 'statisticPage',
			'admin/content': 'manageContentPage',
			'admin/analiz': 'googleAnalizePage',
			'admin/users': 'usersPage',
			'admin/timeline': 'timelinePage'
		},

		initialize: function(){
			window.location = '/#admin/interview';
		},

		interviewPage: function(){
			
		},

		statisticPage: function(){

		},

		manageContentPage: function(){

		},

		googleAnalizePage: function(){

		},

		usersPage: function(){

		},

		timelinePage: function(){
			
		}

	});

	return adminRouter;

})