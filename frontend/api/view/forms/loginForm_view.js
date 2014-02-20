define([
	'text!template/forms/loginFormTpl.htm',
	'backbone'
],function(formTpl){

	var loginFormView = Backbone.View.extend({

		template: _.template(formTpl),

		events: {
			'submit form': 'singIn',
			'focusin input': 'hideError',
			'click .register_btn': 'hideForm',
			'click .twt': 'vkLogin',
			'click .fb': 'facebookLogin'
		},

		initialize: function(){
			this.$el.append( this.template({},null) );
			this.$el = $(".login",this.$el);
			$('.barrier').append( this.$el );		
		},

		showLoginForm: function(){
			$(this.$el).show().siblings().hide();
			$('.barrier').fadeIn(500);
		},

		singIn: function(e){
			var self = this;

			e.preventDefault();
			if( e.type == 'keyup'){
				if( e.keyCode !== 13 ) return;
			}

			var userName = $('input[name="username"]',this.$el).val();
			var userPass = $('input[name="pass"]',this.$el).val();

			if( !userName.validateEmail() ){
				$('input[name="username"]',this.$el).addClass('error').next().show();
				return;
			}

			$.post('/login_check',
				{email: userName, password: userPass},
				function(data){

					if( data.error !== 'false' ){
						
						if( data.errorType == 'nouser')
							$('input[name="username"]',self.$el).addClass('error').next().show();

						if( data.errorType == 'invalidPassword' )
							$('input[name="pass"]',self.$el).addClass('error').next().show();

						return;

					}

					$('.barrier').fadeOut(500);
					window.app.userModel.set('userData',data.userData);
					if( config.pageType == 'mainPage' )
						window.location = '/#author/'+data.userData.id+'/posts';	
										
				},
				'json'
			);

		},

		hideError: function(e){
			$this = $(e.currentTarget);
			$this.removeClass('error').next().hide();
		},

		hideForm: function(){
			$('.barrier').fadeOut(500);
			$('.error',this.$el).removeClass('error').next().hide();
		},

		vkLogin: function(e){
			e.preventDefault();
			window.open('/socauth/vkontakte','','top=100,left=100,width=700,height=400,scrollbars=no,location=no,toolbar=no,directories=no,status=yes,menubar=no,resizable=yes');
		},

		facebookLogin: function(e){
			e.preventDefault();
			window.open('/socauth/facebook','','top=100,left=100,width=700,height=400,scrollbars=no,location=no,toolbar=no,directories=no,status=yes,menubar=no,resizable=yes');
		}		
		

	});


	return loginFormView;

})