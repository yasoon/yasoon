define([
	'view/admin/interviewView',
	'backbone'
],function(interviewView){

	var interviewModel = Backbone.Model.extend({
		view: interviewView,
		url: '/api/interview/save_interview',
		defaults:{
			type: 'create',
			questions: []
		},

		initialize: function(){
			var self = this;
			_.bindAll(self);
			this.view = new this.view({model: this});
		},

		saveModel: function(modelData){
			this.set(modelData);
			$.post(this.url,{interview: this.attributes},this.triggerSuccess,'json');
		},

		deleteModel: function(){
			var self = this;
			$.post('/admin/deleteInterview',{id: this.attributes.id},function(){ self.trigger('deleteModel'); },'json');
		},

		triggerSuccess: function(data){
			var self = this;
			self.set('id',data.id);
			self.trigger('modelSaved');
		}


	});

	return interviewModel;

})