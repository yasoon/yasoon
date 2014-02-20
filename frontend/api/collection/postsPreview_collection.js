define([
	'model/post/post_model',
	'backbone'
],function(postModel){

	var postPreviewCollection = Backbone.Collection.extend({

		model: postModel,

		url: '/api/post/getPost',
		
		initialize: function(models,options){
			this.options = options ? options : false;
			this.view = new Backbone.View();
			this.ready = false;
			this.page = 1;
			this.postsCount = 0;
			
			if( options ){
				if( options.needSort ){
					this.dateSortCollection =  new (Backbone.Collection.extend({model: postModel}));
					this.rateSortCollection =  new (Backbone.Collection.extend({model: postModel}));
					this.dateSortCollection.options = {type: 'postPreview'};
					this.rateSortCollection.options = {type: 'postPreview'};
					//this.dateSortCollection.view = new Backbone.View();
					//this.rateSortCollection.view = new Backbone.View();
				}
			}

		},

		render: function(){
			var self = this;			
			self.view.$el.empty();
			_.each(this.models,function(model){
				self.view.$el.append( model.view.$el );
			});

			return this.view;
		},

		renderSort: function(){
			var self = this;
			self.dateSortCollection.view.$el.empty();
			self.rateSortCollection.view.$el.empty();

			_.each(self.dateSortCollection.models,function(model){
				self.dateSortCollection.view.$el.append( model.view.$el.clone() );
			});

			_.each(self.rateSortCollection.models,function(model){
				self.rateSortCollection.view.$el.append( model.view.$el.clone() );
			});

		},

		updateCollection: function(maxPagePost, catId, callBack){
			var self = this;

			$.ajax({
				url: '/api/post/get_categoryPosts/'+catId+'/'+self.page+'/'+maxPagePost,
				success: function(data){

					if( data == null, data.postsCount <= 0 ){
						self.ready = true;
						callBack();
						return;
					}

					//self.add(data.dateSort);
					self.dateSortCollection.add(data.dateSort);
					self.rateSortCollection.add(data.rateSort);

					if( self.dateSortCollection.length >= data.postsCount ) self.ready = true;
					callBack();

				},
				type: 'GET',
				dataType: 'json'
			})

		},

		updateCollectionPostsList: function(posts,callBack){
			var self = this;

			self.fetch({
				data: {postType: 'needPost', postid: posts },
				success: function(){
					self.render();
					if( self.options.needSort ){ 
						self.comparator = function(post){ return -post.get('formatDate').getTime(); };
					}
					callBack();
				},
				error: callBack,
				type: 'POST',
				remove: false
			})
		},

		sortCollection: function(){	

			this.dateSortCollection.comparator = function(post){ return -post.get('formatDate').getTime(); }		
			this.dateSortCollection.reset();
			this.dateSortCollection.set( this.models );
			this.rateSortCollection.comparator = function(post){ return -post.get('post_likes'); }
			this.rateSortCollection.reset();
			this.rateSortCollection.set( this.models );	

			this.renderSort();
		}


	});



	return postPreviewCollection;

})