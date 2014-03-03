define([
	'model/post/post_model',
	'backbone'
],function(postModel){

	var timelinePostsCollection = Backbone.Collection.extend({
		
		url: 'api/post/getPostsByDate',

		model: postModel,

		initialize: function(model,callback){
			var self = this;
			this.options = {type: 'timeline'};
		},

		updateCollection: function(callback){
			var self = this;
			self.currentUser = app.userModel.attributes.userData;

			if( self.currentUser.friends.length > 0 ){

				var authors = { id: [], date:[] };

				_.each(self.currentUser.friends, function(friend){
					authors.id.push(friend.id);
					authors.date.push(friend.date);
				})

				this.fetch({
					data: {authors: authors},
					type: 'POST',
					success: callback,
					error: callback,
					remove: false
				})

			} else {

				callback();

			}
		}

	});


	return timelinePostsCollection;

})