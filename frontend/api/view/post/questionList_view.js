define([
	'text!template/timeline/questionPreview.htm',
	'backbone'

],function(questionPreview){

	var questionsView = Backbone.View.extend({
		template: _.template(questionPreview),
		initialize: function(){

			if( this.model.attributes.hasAnswer == true)
				this.$el.append( this.template( this.model.attributes) );
		}

	});


	return questionsView;
})