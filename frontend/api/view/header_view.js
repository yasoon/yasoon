define([
	'text!template/header.htm',
	'model/user_model',
	'view/forms/loginForm_view',
	'backbone'
],function(headerTemplate,userModel,loginView){

	var HeaderView = Backbone.View.extend({

		template: _.template(headerTemplate),

		initialize: function(data){

			var self = this;
			_.bindAll(self);
			self.$el = $('header');
			self.render();
			this.loginView = new loginView();
			$('.sing-in, #login, .sign-in',self.$el).unbind('click').live('click',self.showLoginForm);

		},

		render: function(){

			var self = this;
			//self.$el.html('');

			if( window.config.pageType == 'mainPage' ){

				if( !self.partnerInfo ){

					$.get('/api/post/partnerInfo',{},function(data){ 
						self.partnerInfo = data; 

						self.$el.removeClass('log-in');
						if( !$('header .mainPageHeader').is('div') )
							self.$el.html( self.template( {headerType: 'mainPage', partner: self.partnerInfo} ) );

						// Загрузка текущего пользователя
						//if( window.app.userModel ) window.app.userModel.renderLogin();
						//else window.app.userModel = new userModel();
						window.app.userModel = new userModel();

					},'json');

				} else {

					self.$el.removeClass('log-in');
					if( !$('header .mainPageHeader').is('div') )
						self.$el.empty().append( self.template( {headerType: 'mainPage', partner: self.partnerInfo} ) );
					
					// Загрузка текущего пользователя
					//if( window.app.userModel ) window.app.userModel.renderLogin();
					//else window.app.userModel = new userModel();
					window.app.userModel = new userModel();

				}

			} else {
		
				self.$el.addClass('log-in');
				if( !$('header .sidePageHeader').is('div') )
					self.$el.empty().append( self.template({headerType: window.config.pageType}) );

				// Загрузка текущего пользователя
				//if( window.app.userModel ) window.app.userModel.renderLogin();
				//else window.app.userModel = new userModel();
				window.app.userModel = new userModel();
	
			}

			//console.log( 'render' );

			self.delegateEvents();

		},

		showLoginForm: function(e){
			e.preventDefault();
			var self = this;
			self.loginView.showLoginForm();
		}

	});


	return HeaderView;

})