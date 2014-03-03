define([
	'text!template/autor/autorPageTpl.htm',
	'collection/postsPreview_collection',
	'model/autor/autor_model',
	'collection/questionsList_collection',
	'view/post/askQuestion_view',
	'backbone'
],function(pageTpl,postsCollection,autorModel, questionsCollection,askQuestion){

	var autorPageView = Backbone.View.extend({

		template: _.template(pageTpl),

		events: {
			'click .navigate a': 'showTab',
			'click .morePosts': 'updatePostsCollection',
			'click .moreQuestions': 'updateQuestionCollection'
		},

		initialize: function(routerData){
			var self = this;
			self.routerData = routerData;
			_.bindAll(self);
			this.pagePostLimit = 10;

			self.$el.append( self.template({autorId: routerData.autorId}) );
			self.autorId = routerData.autorId;
			self.currentUser = app.userModel.attributes.userData !== false ? app.userModel.attributes.userData.id : false;
			self.render();

			//return;

			self.postsCollection = new postsCollection(null,{needSort: true, type: 'autorPostPreview'});
			self.questionsCollection= new questionsCollection();

			$.post('/api/author/getAuthorInfo',
				{author_id: self.autorId},
				function(autorData){
					
					self.model = new autorModel(autorData[0]);
					self.renderAutorInfo();

					if( self.model.attributes.posts.length > 0 )
						self.askQuestion = new askQuestion({id: self.model.get('id'), name: self.model.get('name') });

					var needPosts = self.getPostsLimit( self.model.get('posts') );
					if( needPosts.lessPosts == 0 ) self.model.set('postsReady',true);
					self.model.set('posts',needPosts.lessPosts);

					self.postsCollection.updateCollectionPostsList(needPosts.postsIds,function(){
						self.renderPosts(false);
					});

					var needQuestions = self.getPostsLimit( self.model.get('answers') );
					if( needQuestions.lessPosts == 0 ) self.model.set('questionsReady',true);
					self.model.set('answers',needQuestions.lessPosts);

					self.questionsCollection.updateCollection(needQuestions.postsIds,function(){
						//$('.postinfo .answersCount',self.$el).html( self.questionsCollection.answersCount );
						self.renderQuestions(false);

						if( self.currentUser !== false && self.autorId == self.currentUser ){
							$.post('/api/author/clearTimeline',{type: 'questions', authorId: self.autorId},function(){
								app.userModel.attributes.userData['timeline']['question_count'] = 0;
								app.userModel.renderLogin();
							},'json');
						}

					});

				},
				'json'
			);
			
		},

		render: function(){

			if( this.routerData.openTab == 'posts' ){
				$('.nav-tabs .postsList',this.$el).show().siblings().hide();
				$('.navigate .postsList',this.$el).addClass('active').siblings().removeClass('active');
			} else {
				$('.nav-tabs .questionsList',this.$el).show().siblings().hide();
				$('.navigate .questionsList',this.$el).addClass('active').siblings().removeClass('active');
			}

			$('section.page_content').empty().html(this.$el);
			$('.postinfo, .nav-tabs .questionsList, .nav-tabs .postsList',this.$el).append( config.loaderImg.big );

		},

		renderAutorInfo: function(){

			if( this.model.view )
				$('.postinfo',this.$el).empty().append( this.model.view.$el );
			else
				window.location = '/#404';

			//window.updateScrolling();
		},

		renderPosts: function(scroll){
			var self = this;

			if (scroll) var lastPostEl = $('.nav-tabs .postsList > div',self.$el).last().offset() ? $('.nav-tabs .postsList > div',self.$el).last().offset().top : 0;
			else var lastPostEl = 0;

			$('.nav-tabs .postsList',this.$el).empty();
			if( window.app.userModel.attributes.userData.id == self.model.get('id') )
				$('.nav-tabs .postsList',this.$el).append('<article class="lim"><a class="btn" href="/#writepost">'+config.getContent(45)+'</a></article>');

			if( this.postsCollection.length == 0 ){
				
				if( app.userModel.attributes.userData.id == self.model.get('id'))
					$('.nav-tabs .postsList',self.$el).append('<article class="lim"><h3>Вы не написали ни одной истории.</h3></article>');
				else
					$('.nav-tabs .postsList',self.$el).append('<article class="lim"><h3>К сожалению, автор не написал историй.</h3></article>');

			} else {

				_.each(this.postsCollection.models,function(post){
					$('.nav-tabs .postsList',self.$el).append( post.view.$el );
				});

			}

			if( !this.model.get('postsReady') ) $('.nav-tabs .postsList',this.$el).append('<article class="bottom-toolbar t-center"><a href="#" class="btn morePosts">Больше историй</a></article>')	
			
			$('html,body').animate({scrollTop: lastPostEl},400);

		},

		renderQuestions: function(scroll){
			var self = this;

			if (scroll) var lastPostEl = $('.nav-tabs .questionsList > div',self.$el).last().offset() ? $('.nav-tabs .questionsList > div',self.$el).last().offset().top : 0;
			else var lastPostEl = 0;

			if( self.askQuestion )
				$('.nav-tabs .questionsList',this.$el).empty().append(self.askQuestion.$el);
			else
				$('.nav-tabs .questionsList',this.$el).empty();

			if( this.questionsCollection.models.length == 0 || this.questionsCollection.answersCount == 0){
				if( window.app.userModel.attributes.userData.id !== self.model.get('id') ){
					$('.nav-tabs .questionsList',self.$el).append( '<article class="lim"><h3>'+config.getContent(47)+'</h3></article>' );
				} else {
					if( self.askQuestion )
						$('.nav-tabs .questionsList',self.$el).append( '<article class="lim"><h3>'+config.getContent(50)+'</h3></article>' );
					else
						$('.nav-tabs .questionsList',self.$el).append( '<article class="lim"><h3>'+config.getContent(48)+'</h3></article>' );		
				}
			} else {
				_.each(this.questionsCollection.models,function(post){
					$('.nav-tabs .questionsList',self.$el).append( post.view.$el );
				});				
			}

			

			if( !this.model.get('questionsReady') ) 
				$('.nav-tabs .questionsList',this.$el).append('<article class="bottom-toolbar t-center"><a href="#" class="btn moreQuestions">'+config.getContent(49)+'</a></article>')	
			
			$('html,body').animate({scrollTop: lastPostEl},400);	
		},

		updatePostsCollection: function(e){
			e.preventDefault();
			var self = this;
			var needPosts = self.getPostsLimit( self.model.get('posts') );
			if( needPosts.lessPosts == 0 ) self.model.set('postsReady',true);
			self.model.set('posts',needPosts.lessPosts);
			self.postsCollection.updateCollectionPostsList(needPosts.postsIds,function(){
				self.renderPosts(true);
			});
		},

		updateQuestionCollection: function(e){
			e.preventDefault();
			var self = this;
			var needQuestions = self.getPostsLimit( self.model.get('answers') );
			if( needQuestions.lessPosts == 0 ) self.model.set('questionsReady',true);
			self.model.set('answers',needQuestions.lessPosts);
			self.questionsCollection.updateCollection(needQuestions.postsIds,function(){
				self.renderQuestions(true);
			});
		},

		showTab: function(event){
			var self = this;
			var $this = $(event.currentTarget);
			if( $this.hasClass('active') ) return;

			var $needBlock = $('.nav-tabs .'+$this.attr('class'),self.$el);
			$this.addClass('active').siblings().removeClass('active');
			$needBlock.siblings().fadeOut(300, function() {	$needBlock.fadeIn(300, function(){ self.selectSort = false; });	});

		},

		getPostsLimit: function(posts){

			var maxPosts = this.pagePostLimit;

			var returnPosts = {
				postsIds: posts,
				lessPosts: []
			};

			if( returnPosts.postsIds.length <= maxPosts ) return returnPosts;

			returnPosts.postsIds = posts.slice(0,maxPosts);
			returnPosts.lessPosts = posts.slice(maxPosts-1, -1);

			return returnPosts;

		}


	});


	return autorPageView;

})