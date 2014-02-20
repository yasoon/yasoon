define([	
	'view/writepost/questionPost',
	'model/writepost/questionModel',
	'backbone'
],function(questionView,questionModel){

	var questionCollection = Backbone.Collection.extend({

		url: '/api/interview/questions/1',

		model: questionModel,

		initialize: function(models,options){

			var self = this;
			this.modelsPos = 0;
			this.writePostModel = options.writePostModel;
			this.view = options.view;
			
			if( models == null )
				this.fetch({ success: function(){ self.trigger('questionsReady');  } });

		}

	});

	return questionCollection;

});