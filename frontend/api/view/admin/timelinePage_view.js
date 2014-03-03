define([
	'collection/admin/timelineCollection',
	'backbone'
],function(timelineCollection){

	var timelinePage = Backbone.View.extend({
		
		events:{
			'click .morePosts': 'nextPage'
		},

		initialize: function(){
			var self = this;
			_.bindAll(self);
			this.$el.empty().append(config.loaderImg.big);
			$('.page_content').empty().append( this.$el );
			this.collection = new timelineCollection();
			this.collection.update(this.render);
		},

		render: function(){
			var self = this;

			this.$el.empty();
			if( this.collection.length == 0 ){
				this.$el.append('<h2>Ничего не найдено!</h2>');
				return;
			}

			this.collection.on('add',this.addModel,this);

			_.each(this.collection.models,function(model){ self.$el.append(model.view.$el); });
			if( !this.collection.ready ) 
				this.$el.append('<article class="bottom-toolbar t-center"><a href="#" class="btn morePosts">Больше Историй</a></article>');
		},

		nextPage: function(e){
			e.preventDefault();
			this.collection.page++;
			var self = this;
			this.collection.update(function(){				
				if( self.collection.ready )
					$('.bottom-toolbar',self.$el).remove();
				else
					$('> div',self.$el).last().after( $('.bottom-toolbar',self.$el) );
			});

		},

		addModel: function(model){
			var self = this;
			self.$el.append(model.view.$el);
		}

	});

	return timelinePage;

})