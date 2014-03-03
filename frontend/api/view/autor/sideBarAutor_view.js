define([
	'text!template/autor/autorTemplate.htm',
	'backbone'
],function(autorTemplate){

	var autorView = Backbone.View.extend({

		events: {
			'click .friend' : 'addFriend'
		},

		initialize: function(){
			var self = this;

			//console.log(this.model.attributes);

			this.$el.append( _.template(autorTemplate, {autor: this.model.toJSON()}) );

			this.follower = false;

			this.currentUserId = app.userModel.attributes.userData.id;

			if( this.currentUserId ){
				var follower = this.model.attributes.friends.indexOf(this.currentUserId);
				if( follower !== -1 ){
					this.follower = true;
					$('.social .friend',self.$el).addClass('close-question').html('Отписаться');
				}
			}

		},

		addFriend: function(e){
			e.preventDefault();
			var self = this;
			this.currentUserId = app.userModel.attributes.userData.id;
			var followObj = {
				authorId: self.model.attributes.id,
				friend: self.currentUserId
			};

			if( self.currentUserId == null ){
				app.view.headerView.showLoginForm();
				//app.view.messageView.render('', 'Вы должны авторизироваться, для того что бы подписаться на атора.');
				return;
			}

			$.post('/api/author/setFriends',followObj,function(data){
				console.log( data );

				if( data.error !== undefined ){
					app.view.messageView.render('', 'Произошла ошибка при отправке данных на сервер, попробуйте еще раз.');
					return;
				}

				if( data.type == 'add' )
					$('.social .friend',self.$el).addClass('close-question').html('Отписаться');

				if( data.type == 'delete' )
					$('.social .friend',self.$el).removeClass('close-question').html('Подписаться');

			},'json');

		}
	});


	return autorView;

})