define([
	'model/post/post_model',
	'model/post/questionModel',
	'backbone'
],function(postModel,questionModel){

	var timelineCollection = Backbone.Collection.extend({

		url: '/admin/get_posts/1/10',
		model: postModel,

		initialize: function(){
			this.posts_on_page = 10;
			this.page = 1;
			this.formatUrl(this.page,this.posts_on_page);
			this.on('add',this.addModel,this);
			this.options = {type : "adminList"};
			//this.update();			
		},

		update: function(callback){
			var self = this;

			this.url = '/admin/get_posts/'+this.page+'/'+this.posts_on_page;

			$.get(this.url,function(data){
				if( data.error !== 'true' || data.length > 0){
					self.add(data);
					if( self.length >= config.siteStat.count_posts ) self.ready = true;
					callback();
				} else {
					callback();
				}
			})

		},

		addModel: function(model){


		},

		formatUrl: function(page,count){ this.url = '/admin/get_posts/'+page+'/'+count; }


	});

	return timelineCollection;

})