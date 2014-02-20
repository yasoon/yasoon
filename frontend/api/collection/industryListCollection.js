define([
	'model/category/category_model',
	'backbone'
],function(category_model){

	var industryListCollection = Backbone.Collection.extend({

		url: '/api/category/get_CategoryList',
		
		model: category_model,

		initialize: function(){
			var self = this;

			this.postsCategoryView = new Backbone.View();
			this.peoplesCategoryView = new Backbone.View();
			this.fetch({reset: true});									
		},

		render: function(){

			var self = this;

			this.peoplesCategoryView.$el.append('<a href="/#peoples/all" class="active" catId="all">Все отрасли</a>');			
			this.postsCategoryView.$el.append('<a href="/#explore/all/date" class="active" catId="all">Все отрасли</a>');

			_.each( self.models, function(catModel){

				var needCat = catModel.toJSON();
				if( needCat.id !== 0 ){
					self.peoplesCategoryView.$el.append('<a href="/#peoples/'+needCat.id+'" catId="'+needCat.id+'">'+needCat.name+'</a>');
					self.postsCategoryView.$el.append('<a href="/#explore/'+needCat.id+'/date" catId="'+needCat.id+'">'+needCat.name+'</a>');
				}				

			});

		},

		createFullModels: function(){

			this.add({id:0});

		}

	});

	return industryListCollection;
		
})