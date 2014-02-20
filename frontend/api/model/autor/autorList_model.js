define([
	'view/autor/autor_listType_view',
	'backbone'
],function(autorView){

	var autorModel = Backbone.Model.extend({
		initialize: function(){
			this.view = new autorView(this);
		}
	})

	return autorModel;
})
	