define([
	'text!template/post/postPreview.htm',
	'text!template/post/dayStory.htm',
	'backbone'

],function(postPreview, dayStory){

	var smallPostView = Backbone.View.extend({

		events: {
			'click .like-this a i': 'addLike'
		},

		initialize: function(model){
			var self = this;
			if( model !== undefined && model !== null )
			    this.model = model;

			if( model.type == 'dayStory' ) self.$el.append( _.template( dayStory,{post: model} ) );
			if( model.type == 'previewPost' || 
				model.type == 'bestStories' ||
				model.type == 'autorPostPreview' ||
				model.type == 'timelinePost') self.$el.append( _.template( postPreview,{post: model} ) );

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


		},

		aa: function(){
			console.log( this.$el.find('.like-this') );
		}				

	});

	return smallPostView;

})
