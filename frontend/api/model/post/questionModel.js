define([
	'view/post/question_view',
	'view/post/questionList_view',
	'backbone'
],function(questionView,questionList_view){

	var questionModel = Backbone.Model.extend({

		url: '/api/author/saveQuestionAnswer',

		initialize: function(){

			var dateArr = this.get('publishDate').split('/');
			var needDate = new Date( dateArr[2],(dateArr[1]-1),dateArr[0] );
			var dateText = dateArr[0]+' '+needDate.getMonthName()+' '+dateArr[2];

			this.set('publishDateText', dateText);
			this.set('formatDate',needDate);

			if( this.collection.type == 'timeline' ){
				this.updateModel();
				this.view = new questionList_view({model: this});
			} else { this.view = new questionView({model: this}); }

		},

		updateModel: function(){
			var self = this;
			if( self.get('avatarImg') == null || self.get('avatarImg') == undefined )
				self.set('avatarImg','/upload/avatar/noAvatar.jpg');
			else
				self.set( 'avatarImg', '/upload/avatar/'+self.get('avatarImg') );
		}


	});

	return questionModel;

})