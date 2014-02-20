define([
	
	'text!template/writepost/questionTpl.htm',
	'backbone'

],function(questionPostTpl){

	var questionPost = Backbone.View.extend({
		template: _.template(questionPostTpl),
		events:{
			'click .a-quertion': 'openQuestion',
			'focusout textarea': 'saveText'
		},
		defaults:{
			text: '',
			question: ''
		},
		initialize: function(){
			var self = this;
			this.$el.append( this.template(self.model.attributes) );
		},

		openQuestion: function(e){
			e.preventDefault();
			var self = this;
			
			var needScroll = self.$el.offset().top;
			$('body,htm').animate({scrollTop: needScroll},200);
			$('.questionContent',this.$el).slideToggle(400);

		},

		saveText: function(e){
			var self = this,
			    $this = $(e.currentTarget);

			if( $this.val() == '' ){
				self.model.set('text', '');
				$('.a-quertion',self.$el).removeClass('active');
				return;
			}

			self.model.set('text', $this.val() );
			$('.a-quertion',self.$el).addClass('active');

		}

	});

	return questionPost;

});