define([
	'model/autor/autor_model',
	'backbone'

],function(autorModel){

	var peoplesCollection = Backbone.Collection.extend({

		model: autorModel,

		initialize: function(model,options){
			this.view = new Backbone.View();

			if( options ){ 
				if( options.type == 'adminList' ) 
					this.type = 'adminList'; 
			}

			this.ready = false;		
			this.page = 1;
			this.peoplesCount = 0;	
		},

		render: function(){
			var self = this;			
			self.view.$el.empty();
			_.each(this.models,function(model){
				self.view.$el.append( model.view.$el );
			});
		},

		updateCollection: function(maxPagePost, catId, callBack){
			var self = this;
			$.ajax({
				url: '/api/post/get_categoryPeople/'+catId+'/'+self.page+'/'+maxPagePost,
				
				success: function(data){
					var peopleLength = 0;
	
					if( data == null || data.peoplesCount <= 0){
						callBack();
						return;
					}

					self.add(data.peoples);
										

					if( self.length >= data.peoplesCount ) self.ready = true;
					callBack();

				},
				error: callBack,
				type: 'GET',
				dataType: 'json'
			})

		},

		updateAllUsers: function(maxPagePost,callBack){
			var self = this;
			$.ajax({
				url: '/admin/getUsers/'+self.page+'/'+maxPagePost,
				
				success: function(data){
					var peopleLength = 0;
					console.log( data );
	
					if( data == null || data.length <= 0){
						callBack();
						return;
					}

					self.add(data);
										

					if( self.length >= config.siteStat.count_users ) self.ready = true;
					callBack();

				},
				error: callBack,
				type: 'GET',
				dataType: 'json'
			})
		}

	});

	return peoplesCollection;

})