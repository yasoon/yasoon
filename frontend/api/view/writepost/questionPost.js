define([
	
	'text!template/writepost/questionTpl.htm',
	'editor',
	'backbone'

],function(questionPostTpl){

	var questionPost = Backbone.View.extend({
		template: _.template(questionPostTpl),
		events:{
			'click .a-quertion': 'openQuestion',
			'blur .redactor_editor': 'saveText'
		},
		defaults:{
			text: '',
			question: ''
		},
		initialize: function(){
			var self = this;
			_.bindAll(self);
			this.$el.append( this.template(self.model.attributes) );
			$('.questions_list',this.model.collection.view.$el).append( this.$el );
			this.$textarea = $('.editor',this.$el);

			this.$textarea.redactor({
				imageUpload: '/api/post/upload_image',
				buttons: [
					'formatting','|',
					'bold','italic','deleted','|',
					'unorderedlist','orderedlist','|',
					'image',
					'video',
					'table',
					'link'
				],
				formattingTags: ['p', 'blockquote']
			});
		},

		openQuestion: function(e){
			e.preventDefault();
			var self = this;
			
			var needScroll = self.$el.offset().top;
			$('body,htm').animate({scrollTop: needScroll},200);
			$('.questionContent',this.$el).slideToggle(300);

		},

		test: function(){
			var self = this;

			console.log( $('.redactor_editor',self.$el).html() );
		},

		saveText: function(e){
			var self = this;

			if( $('.redactor_editor',self.$el).html() == '<p><br></p>' ){
				self.model.set('text', '');
				$('.a-quertion',self.$el).removeClass('active');
				return;
			}

			self.model.set('text', $('.redactor_editor',self.$el).html() );
			$('.a-quertion',self.$el).addClass('active');

		}

	});

	return questionPost;

});