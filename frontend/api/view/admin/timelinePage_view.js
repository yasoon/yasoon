define([
	'collection/admin/timelineCollection',
	'backbone'
],function(timelineCollection){

	var timelinePage = Backbone.View.extend({
		
		el: $('.page_content'),

		initialize: function(){
			this.$el.empty().append(config.loaderImg.big);
			this.collection = new timelineCollection();
			this.listenTo(this.collection,'collectionReady',this.render);
		},

		render: function(){
			var self = this;

			this.$el.empty();
			if( this.collection.length == 0 ){
				this.$el.append('<h2>Ничего не найдено!</h2>');
				return;
			}

			console.log( this.collection.models );

			//_.each(this.collection.models,function(model){ self.$el.append(model.view.$el); })
		}

	});

	return timelinePage;

})