define([
	'view/admin/contentItemView',
	'backbone'
],function(contentView){

	var contentModel = Backbone.Model.extend({
		defaults:{
			type: 'notEmpty'
		},
		initialize: function(){
			this.view = new contentView({model: this});
			this.on('destroy',this.removeView);
		},

		removeView: function(){ this.view.remove(); }

	});

	return contentModel;

})