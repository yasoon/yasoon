define([

	'view/post/smallPost_view',
	'view/post/fullPost_view',
	'model/autor/autor_model',
	'backbone'

],function(smallPostView, fullPostView, autorModel){

	var postModel = Backbone.Model.extend({

		url: '/api/post/getPost',

		initialize: function(model,option){
			var self = this;

			if( self.get('publishDate') ){

				var dateArr = self.get('publishDate').split('/');
				var needDate = new Date( parseInt(dateArr[2]),parseInt((dateArr[1]-1)),parseInt(dateArr[0]) );
				var dateText = dateArr[0]+' '+needDate.getMonthName()+' '+dateArr[2];

				self.set('publishDateText', dateText);
				self.set('formatDate',needDate);

			}

			if( this.collection ){
				
				if( this.collection.options.type == 'bestStories' ){
					this.set('type','bestStories');
					this.view = new smallPostView(this.toJSON());
				}

				if( this.collection.options.type == 'postPreview' ){
					this.set('type','previewPost');
					this.view = new smallPostView(this.toJSON());
				}

				if( this.collection.options.type == 'autorPostPreview' ){
					this.set('type','autorPostPreview');
					this.view = new smallPostView(this.toJSON());
				}

				if( this.collection.options.type == 'adminList' ){
					this.set('type','adminListPost');
					this.view = new smallPostView(this.toJSON());
				}

				if( this.collection.options.type == 'timeline' ){
					this.set('type','timelinePost');
					this.updatePostData();
					this.view = new smallPostView(this.toJSON());
				}
			}

			if( option !== undefined ){

				if( option.postType == 'fullPost' ){
					self.getAutorInfo();
					self.view = new fullPostView({model: self});
					self.autorModel =  new autorModel(self.get('autor'));					
				}

			}

			if( self.get('type') == 'dayStory' ){
				if( self.get('avatarImg') == null || self.get('avatarImg') == undefined )
					self.set('avatarImg',config.getContent(18));
				else
					self.set( 'avatarImg', '/upload/avatar/'+self.get('avatarImg') );
				self.view = new smallPostView(self.toJSON());
			}

		}, 

		render: function(){

			var self = this;

			$.ajax({

				async: false,
				url: '/api/author/getAuthorInfo',
				data: {author_id: self.get('authorId')},
				type: 'POST',
				dataType: 'json',
				success: function(request){
					self.set('autor',request[0]);
					self.set('questions',request[0].answers);					
					self.view = new smallPostView(self.toJSON());
				}

			},'json');

			return self.view;
			
		},

		getAutorInfo: function(){
			var self = this;


			$.ajax({

				async: false,
				url: '/api/author/getAuthorInfo',
				data: {author_id: self.get('authorId')},
				type: 'POST',
				dataType: 'json',
				success: function(request){
					self.set('autor',request[0]);
					if( request[0].answers_count !== undefined)
						self.set('answers_count',request[0].answers_count);
					else
						self.set('answers_count',0);					
				},
				error: function(data){
					console.log( data );
				}

			},'json');

		},

		updatePostData: function(){
			var self = this;

			if( self.get('avatarImg') == null || self.get('avatarImg') == undefined )
				self.set('avatarImg','/upload/avatar/noAvatar.jpg');
			else
				self.set( 'avatarImg', '/upload/avatar/'+self.get('avatarImg') );

			if( self.get('title') == '' || self.get('title') == undefined || self.get('title') == null )
				self.set('title', 'Нет заголовка.');

			if( self.get('description') == '' || self.get('description') == undefined || self.get('description') == null )
				self.set('description', 'Нет описания.');

		}

	});


	return postModel;

})