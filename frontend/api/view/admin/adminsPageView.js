define([	
	'collection/peoplesCollection',
	'backbone'
],function(peoplesCollection){

	var adminsPageView = Backbone.View.extend({
		initialize: function(){
			var self = this;
			_.bindAll(self);

			this.$el.empty().append(config.loaderImg.big);
			$('.page_content').empty().append( this.$el );
			this.collection = new peoplesCollection(null,{type: 'adminList'});
			this.collection.updateAllAdminUsers(this.render);
		},

		render: function(){
			var self = this;

			self.$el.empty();

			if( self.collection.length == 0 ){
				self.$el.empty().append('<h2 class="t-center">Ничего не найдено!</h2>');
				return;
			}
			_.each(self.collection.models,function(model){ self.$el.append(model.view.$el); });
		}


	});

	return adminsPageView;

})