define([
	'text!template/admin/interviewPreview.htm',
	'backbone'
],function(interviewTpl){

	var interviewView = Backbone.View.extend({

		template: _.template(interviewTpl),

		tagName: 'article',
		className: 'interviewBlock',

		events: {
			'click .openInterview': 'openQuestions',
			'click .cancleEdit': 'closeQuestions',
			'click .saveInterview': 'saveInterview',
			'click .deleteInterview': 'deleteInterview',
			'click .addQuestion': 'addQuestion',
			'click .deleteQuestion': 'deleteQuestion'
		},

		initialize: function(){
			this.$el.append( this.template(this.model.attributes) );
			if( this.model.get('id') == 1 ) $('.deleteInterview',this.$el).remove();
			this.$questionList = $('.interview_question_list',this.$el);
			this.$title = $('h2',this.$el);
			this.$editBlock = $('.editBlock',this.$el);
			if( this.model.attributes.type == 'new' ) this.$el.addClass('newInterview');

			this.listenTo(this.model,'modelSaved',this.closeQuestions);
			this.listenTo(this.model,'deleteModel',this.deleteView);
			this.listenTo(this.model,'change',this.addLink);
		},

		openQuestions: function(e){
			e.preventDefault();
			this.$questionList.slideDown(300);
			this.$title.hide(); this.$editBlock.show();
		},

		deleteView: function(e){
			var self = this;
			this.$el.fadeOut(300,function(){ self.remove(); })
		},

		closeQuestions: function(e){
			var self = this;
			if( e !== undefined) e.preventDefault();

			if( this.$el.hasClass('newInterview') ){
				this.$el.fadeOut(300,function(){ self.$el.remove(); })
				return;
			}

			if( this.$el.hasClass('createButtons') ){
				$('.newInterviewButtons',this.$el).empty().append( $('<a href="#" class="btn saveInterview">Сохранить</a><a href="#" class="btn deleteInterview">Удалить</a>') );
				this.$el.removeClass('createButtons');
			}

			this.$questionList.slideUp(300);
			this.$editBlock.hide(); this.$title.show();
		},

		addQuestion: function(e){
			e.preventDefault();
			$('ul',this.$questionList).append('<li>\
					<span>Вопрос: </span>\
					<input type="text" class="interview_question" placeholder="Введите текст вопроса" data-id="false" />\
					<a href="#" class="btn deleteQuestion">Удалить вопрос</a>\
				</li>');
		},

		deleteQuestion: function(e){
			e.preventDefault();
			var $this = $(e.currentTarget);
			$this.parents('li').fadeOut(300,function(){ $(this).remove(); });
		},

		parseView: function(){
			var modelData = {};	
			$('a',this.$title).html( $('[data-field="name"]',this.$editBlock).val() );
			modelData['name'] = $('[data-field="name"]',this.$editBlock).val();

			modelData['questions'] = [];
			$('ul > li',this.$questionList).each(function(){
				var $questionText = $(this).find('input[type="text"]'),
					questionArr = {};

				if( $questionText.attr('data-id') !== 'false' ) questionArr['id'] = parseInt( $questionText.attr('data-id') );
				questionArr['text'] = $questionText.val();

				modelData.questions.push(questionArr);
			});


			return modelData;
		},

		addLink: function(){
			$('.interviewLink',this).html('Ссылка на интервью: <a href="/#writepost/'+this.model.attributes.id+'" target="_blank">'+window.location.origin+'/#writepost/'+this.model.attributes.id+'</a>');
		},

		saveInterview: function(e){
			e.preventDefault();
			this.$el.removeClass('newInterview').addClass('createButtons');
			this.model.saveModel( this.parseView() );
		},

		deleteInterview: function(e){
			e.preventDefault();
			this.model.deleteModel();
		}

	});

	return interviewView;

})