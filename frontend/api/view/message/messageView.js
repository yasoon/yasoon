define([
	'text!template/message/messageBoxTpl.htm',
	'backbone'
],function(messageTpl){

	var messageView = Backbone.View.extend({
		template: _.template(messageTpl),

		events: {
			'click .btn': 'hideMessage'
		},

		el: '',

		initialize: function(){
			this.$el.html( this.template({title: 'Сообщение', text: 'Текст сообщения'},null) );
			this.$el = $('.message',this.$el);
			$('.barrier').append( this.$el );
			$('.barrier').on('click',function(e){
				if( $(e.target).hasClass('barrier') ){
					$('.barrier').fadeOut(500,function(){ 
						$('.barrier .login, .barrier .message').hide(); 
						$('.barrier .p-box.login .error').removeClass('error').val('').next().hide();
					});
				}
			})
		},

		render: function(title,text){
			$('h3',this.$el).html(title);
			$('.content',this.$el).html(text);
			this.$el.show().siblings().hide();
			$('.barrier').fadeIn(500);
			this.delegateEvents();
		},

		hideMessage: function(e){
			e.preventDefault();
			$('.barrier').fadeOut(500);
			
		}

	});

	return messageView;

})