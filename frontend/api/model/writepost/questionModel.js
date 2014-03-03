define([
	'view/writepost/questionPost',
	'backbone'
],function(questionView){

	var questionModel = Backbone.Model.extend({
		view: questionView,
		defaults:{
			text: '',
			question: '',
			type: 'question'
		},
		initialize: function(){
			var self = this;
			this.set('questionNumber',++self.collection.modelsPos);
			this.on('change:text', self.collection.writePostModel.editFullText, this );
			this.view = new this.view({model: self});
		}

	});


	return questionModel;

})