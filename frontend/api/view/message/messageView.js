define([
	'text!template/message/messageBoxTpl.htm',
	'backbone'
],function(messageTpl){

	var messageView = Backbone.View.extend({
		template: _.template(messageTpl),

		events: {
			'click .btn.ok': 'hideMessage',
			'click .btn.cancle': 'hideMessage'
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
			$('.cancle',this.$el).hide();
			$('.ok',this.$el).html('ОК');
			$('.barrier').fadeIn(500);
			this.delegateEvents();
		},

		confirm: function(title,text,handler){
			var self = this;
			$('h3',this.$el).html(title);
			$('.content',this.$el).html(text);

			this.$el.show().siblings().hide();
			$('.cancle',this.$el).show().html('Нет, вернуться в редактор');
			$('.ok',this.$el).html('Да, я хочу этого');

			$('.barrier').fadeIn(500,function(){
				$('.cancle',self.$el).unbind().on('click',function(){ 
					self.hideMessage();
					handler(false); 
					self.delegateEvents();
				})
				$('.ok',self.$el).unbind().on('click',function(){ 
					self.hideMessage();
					handler(true); 
					self.delegateEvents();
				})
			});

			
		},

		hideMessage: function(e){
			if( e !== undefined ) e.preventDefault();
			$('.barrier').fadeOut(500);
		}

	});

	return messageView;

})