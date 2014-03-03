define([
	'backbone'
],function(){

	var writePostModel = Backbone.Model.extend({

		template: _.template('<article questionId=<%= id %> class="questionContent"><h3 class="questionTitle"><%= questionTitle %></h3><div class="question_content"><%= questionText %></div></article>'),

		defaults: {
			'category': [],
			'postTitle': null,
			'postText': '',
			'postDescription': null,
			'questionList': null
		},

		initialize: function(){
			var self = this;
			this.$fullText = $('<div class="post_text"></div>');

			if( this.attributes.authorId == undefined )
				this.set('authorId',app.userModel.attributes.userData.id);
			
			_.bindAll(self);

			console.log( this.attributes.questionList );

			if( this.attributes.questionList !== undefined )
				this.generateFullText();
		},

		editFullText: function(model){

			var self = this,
			    question = model.attributes;

			if( self.$fullText.find('article[questionid='+question.id+']').is('article') ){
				if( question.text == '' ) 
					self.$fullText.find('article[questionid='+question.id+']').remove();
				else 
					self.$fullText.find('article[questionid='+question.id+']').find('.question_content').html(question.text);
			} else {
				self.$fullText.append( self.template({id: question.id ,questionTitle: question.question, questionText: question.text}) );
			}
			

			//$('.seeContent').html( self.$fullText.html() );
			self.set('postText',self.$fullText.html() );

			var questionListArr = [];
			_.each( model.collection.models,function(question){
				question = question.attributes;
				var questionArr = {};
				questionArr['id'] = question.id;
				questionArr['text'] = question.text;
				questionListArr.push( questionArr );
			})

			self.set( 'questionList', questionListArr);

		},

		generateFullText: function(){
			var questionListArr = [],
				self = this;

			_.each( this.attributes.questionList,function(question){
				if( question.text !== '' )
					self.$fullText.append( self.template({id: question.id ,questionTitle: question.question, questionText: question.text}) );
			});

			console.log(self.$fullText.html());

			$('.writePost').append('<div class="testContent"></div>').append(self.$fullText.html());

			self.set('postText',self.$fullText.html() );
		},

		savePost: function(){

			$.post('/api/post/savePost',{postData: this.attributes }, function(data){
				if( data.error ){
					app.view.messageView.render('', 'Произошла ошибка при отправке данных на сервер, попробуйте еще раз.');
					return;
				}
				window.location = '/#post/'+data.postId;

			},'json');


		},

		updatePost: function(){
			var self = this;

			$.post('/api/post/update',{postData: this.attributes }, function(data){

				if( data.error ){
					if( data.errorText == 'accessDenied' )
						app.view.messageView.render('','Отказано в доступе.');
					else 
						app.view.messageView.render('', 'Произошла ошибка при отправке данных на сервер, попробуйте еще раз.');
					return;
				}

				window.location = '/#post/'+self.attributes.postid;

			},'json');			
		},

		deletePost: function(){
			var self = this;

			$.post('/api/post/deletePost',{ post_id: this.attributes.postid },function(data){

				if( data.error ){
					if( data.errorText == 'accessDenied' )
						app.view.messageView.render('','Отказано в доступе.');
					else 
						app.view.messageView.render('', 'Произошла ошибка при отправке данных на сервер, попробуйте еще раз.');
					return;
				}

				window.location = '/#author/'+self.attributes.authorId+'/posts';

			},'json');
		}

	});

	return writePostModel;

})