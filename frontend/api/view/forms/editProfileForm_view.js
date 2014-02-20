define([
	'text!template/forms/autorProfileTpl.htm',
	'text!template/forms/registerForm_first.htm',
	'text!template/forms/registerForm_second.htm',
	'model/autor/autor_model',
	'backbone'
],function(editFormTpl,registerFormFirst,registerFormSecond,autor_model){
	
	var editProfileForm = Backbone.View.extend({

		template: _.template( editFormTpl ),
		
		events:{
			'focusout input[necessarily]': 'validateInput',
			'focusin [data-field]': 'hideErrors',
			'submit form': 'saveAutorInfo',
			'click .reg_srep2': 'saveAutorInfo',
			'click [data-send-button]': 'registerNewUser',
			'focusin [data-field="new_password"]': 'showOldPass',
			'focusout [data-field="new_password"]': 'hideOldPass',
			'keydown [data-field="interviewCaption"]': 'symbolsCounter',
			'keyup [data-field="interviewCaption"]': 'symbolsCounter',
			'click .btn_upload_img': 'clickFile'
			//'change [type="file"]': 'uploadImg'

		},

		initialize: function(options){

			this.loginUser = window.app.userModel.attributes.userData;
			this.pageType = options.pageType;
			this.maxSymbols = 199;			

			this.validateError = false;

			if( this.loginUser ){

				if( this.pageType == 'editProfile' ){
					this.model = new autor_model(this.loginUser,{needView: false});
					this.$el.empty().append( _.template(editFormTpl,this.loginUser) );
					this.symbolsCounter();
					$('[data-field="new_password"]',this.$el).val('');

				} else {

					window.location = '/#author/'+this.loginUser.id+'/posts';

				}

			} else {

				if( this.pageType == 'editProfile' ){
					this.$el.append('Вы не авторизированы, пройдите <a href="/#register">регистрацию</a>');
				} else {
					this.$el.empty().append( _.template(registerFormFirst,{}) );
				}

			}

		},

		clickFile: function(){
			$('[type="file"]',this.$el).click();
		},

		symbolsCounter: function(){
			var $area = $('[data-field="interviewCaption"]',this.$el),
			    $counter = $('.simbolsLeft b',this.$el),
			    maxSymbols = this.maxSymbols,
			    nowSymbols = $area.val().length;

			$counter.html( maxSymbols - nowSymbols );

		},

		showOldPass: function(e){
			$(e.currentTarget).next().show();
		},

		hideOldPass: function(e){
			if( $(e.currentTarget).val() == '' ){
				$(e.currentTarget).next().hide();
				return;
			}

			if( $(e.currentTarget).next().find('input').val() == '' ){
				$(e.currentTarget).next().find('input').addClass('error');
			}
		},

		validateInput: function(e){

			var $this = $(e.currentTarget);
			var fieldText = $this.val(),
				dataType = $this.attr('data-field');

			if( fieldText == '' ){
				$this.addClass('error');
				this.validateError = true;
			} else {
				this.validateError = false;
			}

			if( dataType == 'email' ){
				if( !fieldText.validateEmail() ){
					$this.addClass('error').next().show();
					this.validateError = true;
				} else {
					this.validateError = false;
				}
			}

		},

		registerNewUser: function(){

			var self = this;

			this.showErrors();

			if( !this.validateError ){

				var userObj = {type: 'new'};

				$('[data-field]',this.$el).each(function(field){
					var fieldType = $(this).attr('data-field');
					var text = $(this).val();
					userObj[fieldType] = text;
				});

				if( this.model ){
					this.model.set(userObj);
					this.model.createNewUser();
				} else {
					this.model = new autor_model(userObj,{needView: false});
					this.listenTo(this.model,'registerCallback',this.showSecondRegister);
				}			

				this.validateError = true;
			} 

		},

		showErrors: function(){
			var self = this;
			self.validateError = false;

			$('[necessarily]',this.$el).each(function(){
				
				if( $(this).val() == '' ){
					$(this).addClass('error').next().show();
					self.validateError = true;
				} 

				if( $(this).attr('data-field') == 'email' ){

					if( !$(this).val().validateEmail() ){
						$(this).addClass('error').next().show();
						this.validateError = true;
					} 

				}				
			});

			if( $('[data-field="new_password"]',self.$el).val() !== '' ){
				if( $('[data-field="old_password"]',self.$el).val() == '' ){
					$('[data-field="old_password"]',self.$el).addClass('error');
					this.validateError = true;
				}					
			}
		},

		showSecondRegister: function(){
			this.$el.empty().append( _.template(registerFormSecond,{}) );
			this.delegateEvents();

			$('#fileuploadr').fileupload({
		        dataType: 'json',
		        autoUpload: true,
		        number: 1,
		        done: function(e, data) {
		          var fileName;
		          fileName = data.result.dir + data.result.file_name;
		          $(".files_success_upload",self.$el).append('<img src="' + fileName + '" width="53" height="53"/>');
		        }
		     });

		},

		saveAutorInfo: function(e){
			e.preventDefault();
			var self = this;

			this.showErrors();

			if( !this.validateError ){

				$('[data-field]',this.$el).each(function(field){
					var fieldType = $(this).attr('data-field');
					var text = $(this).val();

					if( fieldType == 'newpass' || fieldType == 'old_password'){
						if( $('[data-field="old_password"]',this.$el).val() !== '' )
							self.model.set(fieldType,text);
					} else {
						self.model.set(fieldType,text);
					}
				});

				$('.reg_srep2, .regbtn',self.$el).hide().after(config.loaderImg.big);

				$.ajax({
					url: '/api/author/editinfo',
					type: 'POST',
					data: {autorInfo: self.model.attributes},
					success: function(request){
						window.location = '/#author/'+self.model.attributes.id+'/posts';
					},
					error: function(request){
						$('.reg_srep2, .regbtn',self.$el).show();
						$('.loader',self.$el).remove();
						window.app.view.messageView.render('Ошибка', 'Произошла ошибка при отправке данных, попробуйте снова.');
					},
					dataType: 'JSON'
				});

				this.validateError = true;


			} else {

				$('body,html').animate({ 'scrollTop': 0 },'fast');

			}
		},

		hideErrors: function(e){
			var $this = $(e.currentTarget);
			$this.removeClass('error');
			$this.parent().find( $('.hide-warning') ).hide();
		}

	});

	return editProfileForm;

})