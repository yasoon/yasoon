define([
	'text!template/post/questionPreview.htm',
	'backbone'
],function(questionTpl){

	var questionView = Backbone.View.extend({

		template: _.template(questionTpl),

		events:{
			'click .answer': 'showAnswerArea',
			'click .close-question': 'hideAnswerArea',
			'focusin textarea': 'clearError'
		},

		initialize: function(){
			var self = this;
			this.textareaOpen = false;
			this.$el.append( self.template({question: self.model.attributes} ) );
			this.delegateEvents();

			_.bindAll(this, 'onModelSaved');
			this.model.bind('sync', this.onModelSaved, this.model);

		},

		showAnswerArea: function(e){
			e.preventDefault();
			var self = this;
			if( !this.textareaOpen ){

				$('textarea',this.$el).slideDown(300);
				$('.close-question',this.$el).html('Отмена');
				this.textareaOpen = true;

			} else {

				if( $('textarea',this.$el).val() == '' ){
					$('textarea',this.$el).addClass('error').val('Вы не можете отправить пустой ответ.');
					this.textareaOpen = false;
					return;
				}

				this.model.set('questionAnswerText',$('textarea',this.$el).val());

				this.model.set('type','answer');

				$.post('/api/author/saveQuestionAnswer',this.model.attributes,function(data){
					self.onModelSaved(self.model.attributes,data);
				});

			}
		},

		hideAnswerArea: function(e){
			e.preventDefault();
			var self = this;

			if( this.textareaOpen ){
				$('textarea',this.$el).slideUp(300);
				$('.close-question',this.$el).html('Удалить');
				this.textareaOpen = false;
				return;
			}

			this.model.set('type','delete');
			$.post('/api/author/saveQuestionAnswer',this.model.attributes,function(data){
				self.onModelSaved(self.model.attributes,data);
			});

		},

		clearError: function(e){
			$this = $(e.currentTarget);
			$this.val('').removeClass('error');
		},

		onModelSaved: function(model, response){
			var self = this;

			if( model.type !== 'delete' ){

				if( response.error ){
					window.app.view.messageView.render('Ошибка',response.errorText);
					return;
				}

				window.app.view.messageView.render('Успех','Ваш ответ на вопрос успешно сохранен.');

				$('textarea',this.$el).hide().parent().html( this.model.get('questionAnswerText') );
				$('textarea, .close-question, .answer',this.$el).remove();
				$('.postinfo .answersCount').html( parseInt($('.postinfo .answersCount').html()) + 1 );

			} else {

				this.$el.fadeOut(500,function(){ this.model.destroy(); this.remove();	});

			}

		}

	});

	return questionView;	

})