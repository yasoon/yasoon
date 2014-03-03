define([
	'view/profile/login_side',
	'backbone'
],function(loginView){

	var userModel = Backbone.Model.extend({

		url: '/api/author/getShortuserData',
		defaults:{
			userData:{
				timeline:{
					'answers_count': 0,
					'posts_count': 0,
					'question_count': 0
				},
				newsCount: 0
			}
		},
		initialize: function(model){
			var self = this;
			self.bind('change', _.bind( self.renderLogin, self ) );
				
			if( model == undefined ){
				//Запрос на данные о пользователе
				$.ajax({
					url: self.url,
					success: function(request){
						
						if( request.userData.avatarImg == null || request.userData.avatarImg == undefined )
							request.userData.avatarImg = '/upload/avatar/noAvatar.jpg';
						else
							request.userData.avatarImg = '/upload/avatar/'+request.userData.avatarImg;
		
						if( request.userData !== false && request.userData.roles.indexOf('ROLE_ADMIN') !== -1 )
							request.userData['role'] = 4;
						else
							request.userData['role'] = 2;



						self.set(request);

						window.app.userModel = self;										
					},
					dataType: 'json',
					async: false
				});
			} 	

		},

		renderLogin: function(){
			var self = this;	

			var timeline = self.attributes.userData['timeline'];
			if( timeline !== null && timeline !== undefined){
				var newsCount = timeline.question_count + timeline.posts_count + timeline.answers_count;
				self.attributes.userData['newsCount'] = newsCount;
			} else {
				self.attributes.userData['timeline'] = {
					'answers_count': 0,
					'posts_count': 0,
					'question_count': 0
				};
				self.attributes.userData['newsCount'] = 0;
			}
			

			if( self.view ) self.view.remove();			
			self.view = new loginView({model: this});
		}

	});

	return userModel;

})