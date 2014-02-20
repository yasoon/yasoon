define([
	'text!template/post/postFullTextTpl.htm',
	'backbone'
],function(postTpl){

	var fullPostView = Backbone.View.extend({

		events: {
			'click .like-this a': 'addLike'
		},
		initialize: function(){
			this.$el.append( _.template(postTpl,{postInfo: this.model.toJSON()}) );
		},

		addLike: function(e){
			e.preventDefault();
			var self = this;
			var postObj = {
				postId: self.model.id,
				type: 'add'
			};

			$.post('api/post/add_likes',{ 'postlike': postObj },function(request){
				if( request.error !== undefined && request.error == true){

					if( request.errorText == 'userLiked' )
						app.view.messageView.render( 'Ошибка','Вы уже вдохновлялись данной историей!' );
					if( request.errorText == 'timeLimit' )
						app.view.messageView.render( 'Ошибка','Не авторизованные пользователи могут вдохновиться историей только раз в сутки!' );

					return;
				}
				if( $('.like-this > span',self.$el).is('span') ) $('.like-this b',self.$el).html( request.count );
				else $('.like-this',self.$el).removeClass('emptyLike').append('<b>'+request.count+'</b><span>вдохновились</span>');	
			},'json');


		}				


	});

	return fullPostView;

})