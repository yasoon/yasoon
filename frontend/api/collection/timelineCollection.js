define([
	'collection/questionsList_collection',
	'collection/timelinePosts_collection',
	'backbone'
],function(questionsCollection, postsCollection){

	var timelineCollection = Backbone.Collection.extend({
		
		url: 'api/post/getPostsByDate',

		comparator: function(post){ return -post.get('formatDate').getTime(); },

		initialize: function(){
			var self = this;			
			this.ready = false;
			self.currentUser = app.userModel.attributes.userData;

			this.postsCollection = new postsCollection(null);
			this.questionsCollection = new questionsCollection(null,{type: 'timeline'});

			this.postsCollection.updateCollection(function(){
				if( self.postsCollection.length > 0 )
					self.add(self.postsCollection.models);
				
				if( !self.ready ){ self.ready = true; return; }

				self.trigger('readyCollection');
			});			

			this.questionsCollection.updateCollection(self.currentUser.ask_questions,function(){
				if( self.questionsCollection.length > 0 )
					self.add(self.questionsCollection.models);

				if( !self.ready ){ self.ready = true; return; }

				self.trigger('readyCollection');

			})

		}


	});


	return timelineCollection;

})