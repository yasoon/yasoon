define([
	'text!template/profile/login_side.htm',
	'backbone'
],function(loginTemplate){

	var loginSideView = Backbone.View.extend({

		template: _.template(loginTemplate),

		initialize: function(){
			this.render();
		},

		render: function(model){

			var self = this;
			self.$el.html( self.template( { user: self.model.attributes.userData } ) );
			$('header .inside .login_side').empty().append(self.$el);

		}

	});


	return loginSideView;

})