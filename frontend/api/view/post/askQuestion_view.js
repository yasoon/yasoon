define([
	'text!template/post/askQuestion.htm',
	'backbone'
],function(askQuestionTpl){

	var askQuestion = Backbone.View.extend({

		template: _.template(askQuestionTpl),

		events: {
			'click .askQuestion': 'showAskForm',
			'click .cancle_ask': 'hideAskForm',
			'focusout [data-field="askQuestion"]': 'hideError'
		},

		initialize: function(author){
			var self = this;
			self.author = author;
			self.currentUserId = app.userModel.attributes.userData.id ? app.userModel.attributes.userData.id : false;
			self.displayForm = false;
			if( self.currentUserId !== undefined && author.id !== self.currentUserId) self.render();
		},
		
		render: function(){
			var self = this;
			this.$el.empty().append( this.template({authorName: self.author.name}) );
		},

		showAskForm: function(e){
			e.preventDefault();
			var self = this;

			if( self.currentUserId == false ){
				app.view.messageView.render('Ошибка','Вы должны авторизироваться, для того что бы задать вопрос автору.');
				return;
			}

			if( !self.displayForm ){
				$('.askForm',this.$el).slideDown(400);
				$('.askMessage',self.$el).hide();
				$('[data-field="askQuestion"]',self.$el).val('');
				$('.cancle_ask',this.$el).show();
				self.displayForm = true;
				return;
			}

			if( $('[data-field="askQuestion"]',self.$el).val() == ''){
				$('[data-field="askQuestion"]',self.$el).addClass('error');
				return;
			}

			self.showPreloader();
			self.sendQuestion();

		},

		hideAskForm: function(e){
			if( e !== undefined ) e.preventDefault();
			var self = this;
			$('.askForm',self.$el).slideUp(400);
			$('.cancle_ask',self.$el).hide();
			self.displayForm = false;
		},

		sendQuestion: function(){
			var self = this;

			var	questionObj = {
				ask_authorId: self.currentUserId,
				authorId: self.author.id,
				question: $('[data-field="askQuestion"]',self.$el).val()
			};
			
			$.post('/api/author/setQuestion',questionObj,function(data){
				if( data.error ){
					app.view.messageView.render('Ошибка','Произошла ошибка при сохранении данных на сервере, попробуйте еще раз.');
					return;
				}
				//app.view.messageView.render('Успех','Ваш вопрос успешно сохранен.');
				self.hidePreloader();
				self.hideAskForm();
				$('.askMessage',self.$el).show();
				$('.askQuestion',self.$el).html('Задать еще один вопрос');
				self.displayForm = false;


			},'json');

		},

		hideError: function(e){
			$(e.currentTarget).removeClass('error');
		},

		showPreloader: function(){
			$('.btn.askQuestion, .btn.cancle_ask',this.$el).hide();
			$('.btn.cancle_ask',this.$el).after(config.loaderImg.big);
		},
		hidePreloader: function(){
			$('.btn.askQuestion',this.$el).show();
			$('.loader',this.$el).remove();
		}

	});

	return askQuestion;

})