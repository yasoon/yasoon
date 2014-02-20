define([
	'model/post/questionModel',
	'backbone'
],function(questionModel){

	var questionsCollection = Backbone.Collection.extend({
		
		url: '/api/post/getQuestions',

		model: questionModel,

		comparator: function(post){ return post.get('hasAnswer') },

		initialize: function(model,options){
			this.ready = false;
			this.on('add',this.addQuestion,this);
			if( options !== undefined ) this.type = options.type;
			this.answersCount = 0;
		},

		updateCollection: function(questionsIds, callback){
			var self = this;
			if( questionsIds.length > 0 ){

				this.fetch({
					data: {questionid: questionsIds},
					type: 'POST',
					success: callback,
					error: callback,
					remove: false
				});

			} else {
				callback();
			}

		},

		addQuestion: function(model){
			if( model.get('hasAnswer') ) this.answersCount++;
		}

	});


	return questionsCollection;
})