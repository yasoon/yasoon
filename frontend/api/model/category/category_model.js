define([
	'collection/postsPreview_collection',
	'collection/peoplesCollection',
	'backbone'

],function(postsCollection, peoplesCollection){

	var categoryModel = Backbone.Model.extend({

		initialize: function(){
			var self = this;
			self.pagePostLimit = 10;
		},

		getPeoples: function(callBack,nextpage){
			var self = this;

			if( !nextpage ){
				self.peoplesCollection = new peoplesCollection();
				self.peoplesCollection.updateCollection( self.pagePostLimit, self.get('id'), callBack);
				return;
			}
				
			if( self.peoplesCollection.ready == false ){

				if( nextpage ) { 

					self.peoplesCollection.page++;
					self.peoplesCollection.updateCollection( self.pagePostLimit, self.get('id'), callBack);

				} else {

					callBack();

				}

			} else {

				callBack();

			}	

		},

		getPosts: function(callBack,nextpage){
			var self = this;

			if( !nextpage ){
				self.postsCollection = new postsCollection(null, {type: 'postPreview',needSort: true});
				self.postsCollection.updateCollection( self.pagePostLimit, self.get('id'), callBack);
				return;
			}
				
			if( self.postsCollection.ready == false ){

				if( nextpage ) { 
					self.postsCollection.page++;
					self.postsCollection.updateCollection( self.pagePostLimit, self.get('id'), callBack);
				} else {

					callBack();	
									
				}

			} else {

				callBack();

			}	

		}

	});

	return categoryModel;

})