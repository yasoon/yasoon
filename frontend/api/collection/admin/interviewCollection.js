//get_interviews get
define([
	'model/admin/interviewModel',
	'backbone'
],function(interviewModel){

	var interviewCollection = Backbone.Collection.extend({
		model: interviewModel,
		url: '/api/interview/get_interviews',

		initialize: function(models,view){
			this.view = view;
			this.on('add',this.addModel,this);
			this.fetch({ reset: true });			
		},

		addModel: function(model){
			this.view.$el.find('.addInterview').parent().before(model.view.$el);
			model.view.$el.hide().slideDown(400);
		}

	});

	return interviewCollection;

})