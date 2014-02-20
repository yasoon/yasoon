define([
	'collection/peoplesCollection',
	'backbone'
],function(peoplesCollection){

	var usersPageView = Backbone.View.extend({
		
		el: $('.page_content'),

		events: {
			'click .morePeoples': 'updateCollection'
		},

		initialize: function(){
			var self = this;
			_.bindAll(self);
			this.peoples_on_page = 10;
			this.$el.empty().append(config.loaderImg.big);

			this.collection = new peoplesCollection(null,{type: 'adminList'});
			this.collection.updateAllUsers(this.peoples_on_page,this.render);
		},

		render: function(){
			var self = this;

			this.$el.empty();
			if( this.collection.length == 0 ){
				this.$el.append('<h2 class="t-center">Ничего не найдено!</h2>');
				return;
			}

			this.collection.on('add',this.addPeoples,this);

			_.each(this.collection.models,function(model){ self.$el.append(model.view.$el); });
			if( !this.collection.ready ) 
				this.$el.append('<article class="bottom-toolbar leftM t-center"><a href="#" class="btn morePeoples">Больше людей</a></article>');

		},

		updateCollection: function(e){
			e.preventDefault();
			var self = this;
			this.collection.page++;
			this.collection.updateAllUsers(this.peoples_on_page,function(){ 
				if( self.collection.ready )
					$('.bottom-toolbar',self.$el).remove();
			});
		},

		addPeoples: function(model){
			var self = this;
			self.$el.append(model.view.$el);
		}

	});

	return usersPageView;

})