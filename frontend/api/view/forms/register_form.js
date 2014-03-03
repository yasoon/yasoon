define([

	'text!template/forms/registerForm_first.htm',
	'backbone'

],function(registerForm_first){

	var registerFormView = Backbone.View.extend({

		events:{
			'focusout input[necessarily]': 'validateInput',
			'focusin input[necessarily]': 'hideErrors',
			'submit form': 'saveAutorInfo'
		},

		initialize: function(){

			this.loginUser = window.app.userData;
			this.validateError = {
				mail: false,
				empty: false
			}

			if( this.loginUser.attributes.userData !== false ){
				window.location = '/#autor/'+this.loginUser.attributes.userData.id+'/posts';
			} else {
				this.$el.append( _.template(registerForm_first) );
			}

		},

		validateInput: function(e){

			var $this = $(e.currentTarget);
			var fieldText = $this.val(),
				dataType = $this.attr('data-field');

			var error = false,
				mailError = false;

			if( fieldText == '' ){
				$('.hide-warning.'+dataType,this.$el).show();
				$this.addClass('error');
				this.validateError.empty = true;
			} 

			if( dataType == 'email' ){
				if( !fieldText.validateEmail() ){
					$('.hide-warning.wrongMail',this.$el).show();
					$this.addClass('error');
					this.validateError.mail = true;
				}
			}

		},

		saveAutorInfo: function(e){
			e.preventDefault();
			var self = this;

			if( !this.validateError.empty && !this.validateError.mail ){

				$('[data-field]',this.$el).each(function(field){
					var fieldType = $(this).attr('data-field');
					var text = $(this).val();
					self.model.set(fieldType,text);
				});

				$.ajax({
					url: 'api/author/editinfo',
					method: 'POST',
					data: {autorInfo: self.model.attributes},
					success: function(rquest){
						window.location = '/#author/'+rquest.id+'/posts';
						//window.app.view.messageView.render('Успешно', 'Ваши данные успешно были изменены.');
					},
					error: function(reques){
						window.app.view.messageView.render('', 'Произошла ошибка при отправке данных, попробуйте снова.');
					},
					dataType: 'JSON'
				});

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


	return registerFormView;
})