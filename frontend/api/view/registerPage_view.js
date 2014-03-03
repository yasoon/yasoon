define([
	'text!template/profile/registerPage.htm',
	'view/forms/register_form',
	'backbone'
],function(pageTpl,registerFormView){

	var registerPageView = Backbone.View.extend({
		template: _.template(pageTpl),

		initialize: function(){

			this.$el.append( this.template() );
			this.formView = new registerFormView();
			this.render();
		},

		render: function(){
			$('section.page_content').empty().html(this.$el);
			$('section.registerPage').empty().append(this.formView.$el);
		}
	});

	return registerPageView;

})