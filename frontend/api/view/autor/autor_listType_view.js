define([
	'text!template/autor/autor_list_template.htm',
	'text!template/admin/authorTpl.htm',
	'backbone'
],function(autorTpl,adminAuthorTpl){

	var autorView = Backbone.View.extend({

		template: _.template(autorTpl),
		//el: 'div',

		initialize: function(model){
			if( this.model.collection.type == 'adminList' )
				this.$el.append( _.template(adminAuthorTpl, {autor: this.model.attributes}) );
			else
				this.$el.append( this.template({autor: this.model.toJSON()}) );
		}

	});


	return autorView;

})