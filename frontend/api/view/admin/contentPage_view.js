define([
	'model/admin/contenModel',
	'backbone'
],function(contentModel){

	var contenPageView = Backbone.View.extend({

		events: {
			'click .addContent': 'addContent'
		},

		initialize: function(){
			var self = this;
			_.bindAll(self);
			this.$el.empty().append(config.loaderImg.big);
			$('.page_content').empty().append( this.$el );

			this.collection = new (Backbone.Collection.extend({ 
				model: contentModel, 
				url: '/api/content/get_all',
				initialize: function(){ this.fetch({reset: true}); } 
			}));

			this.listenTo(this.collection,'reset',this.render);

		},

		render: function(){
			var self = this;
			this.$el.empty();
			if( this.collection.length == 0 ){
				this.$el.append('<h2>Контент не найден!</h2>');
				return;
			}
			this.collection.on('add',this.addModel, this);
			_.each(this.collection.models,function(model){ self.$el.append(model.view.$el); })
			this.$el.append('<article class="bottom-toolbar t-center"><a href="#" class="btn addContent">Добавить контент</a></article>');
		},

		addContent: function(e){ e.preventDefault(); this.collection.add({type: 'new'}) },
		addModel: function(model){ 
			this.$el.append(model.view.$el); 
			$('.contentItem',this.$el).last().after( $('.bottom-toolbar',this.$el) ); 
		}

	});

	return contenPageView;

})