define([
	'backbone'
],function(){

	var categoriesListView = Backbone.View.extend({

		events: {
			'click a': 'getPostList'
		},

		initialize: function(){

			this.$el.append('<a href="/#explore/all/date" class="active">ВСЕ</a>');

		},

		getPostList: function(){
			
		}



	})


});