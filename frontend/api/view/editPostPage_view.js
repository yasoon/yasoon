define([
	'text!template/writepost/pageTpl.htm',
	'collection/newPostQuestionsCollection',
	'model/writepost/writepost_model',
	'backbone'

],function(pageTpl,questionCollection,writepostModel){

	var writepostPageView = Backbone.View.extend({

		template: _.template(pageTpl),

		events: {
			'click .navigate a': 'showTab',
			'click .select [type="checkbox"]': 'catSelect',
			'click .savePost': 'savePost',
			'click [data-field]': 'removeErrors',
			'click .deletePost': 'deletePost'
		},

		initialize: function(postId){
			var self = this;

			$.get('/api/category/get_CategoryList',{},function(data){

				self.$el.append( self.template({industryList: data}) );
				self.$questionListBlock = $('.questions_list',this.$el);
				
				$.get('api/post/getEditPost/'+postId.postId,{},function(data){

					self.writepostModel = new writepostModel(data);
					self.writepostModel.set('postid',parseInt(postId.postId));

					self.questionCollection = new questionCollection(
						self.writepostModel.get('questionList'),
						{
							writePostModel: self.writepostModel, 
							view: self
						}
					);

					self.putPostData();
					self.render();
					

				});
				
			},'json');							
			
		},		

		render: function(){
			var self = this;

			if( !$('section.page_content').find('.writePost').is('section') ){

				$('section.page_content').empty().append(this.$el);
				$('.select',this.$el).multiselect();
				this.delegateEvents();
			}
		},

		putPostData: function(){
			var self = this,
				postData = this.writepostModel.attributes;

			if( postData.authorId !== app.userModel.attributes.userData.id ){
				this.$el.html( '<h2>Данную историю написал <a href="/#author/'+postData.authorId+'/posts">'+postData.authorName+'</a>, вы не можете редактировать данную историю.</h2>' );
				return;
			}

			$('[data-field="postTitle"]',self.$el).val(postData.postTitle);
			$('[data-field="postDescription"]',self.$el).val( postData.postDescription );

			_.each( postData.category, function(catId){
				$('.select [value="'+catId+'"]',self.$el).attr('checked','checked');
			});

		},

		catSelect: function(){

			var catArr = [];
			$('.select [type="checkbox"]',this.$el).each(function(checkbox){
				if( $(this).attr('checked') ) catArr.push( $(this).val() );
			});

			this.writepostModel.set('category',catArr);
		},

		savePost: function(e){
			e.preventDefault();
			var errors = false;

			if( this.writepostModel.get('category').length == 0 ){
				$('.selectBox > p',this.$el).addClass('error');
				errors = true;
			}

			if( $('[data-field="postTitle"]',this.$el).val() == '' ){
				$('[data-field="postTitle"]',this.$el).addClass('error');
				errors = true;
			}

			if( $('[data-field="postDescription"]',this.$el).val() == '' ){
				$('[data-field="postDescription"]',this.$el).addClass('error');
				errors = true;
			}

			if( this.writepostModel.get('postText') == '' ){
				app.view.messageView.render('Ошибка','Вы не написали ответа ни на один вопрос.');
				errors = true;
			}

			if( !errors ){
				this.writepostModel.set('postTitle',$('[data-field="postTitle"]',this.$el).val());
				this.writepostModel.set('postDescription',$('[data-field="postDescription"]',this.$el).val());
				$('.buttons_area',this.$el).empty().append(config.loaderImg.big);
				this.writepostModel.updatePost(); 
			}
			else $('body,html').animate({scrollTop: 0},400);


		},

		removeErrors: function(e){
			$(e.currentTarget).removeClass('error');
		},

		showTab: function(e){
			e.preventDefault();
			var $this = $(e.currentTarget);
			var self = this;
			if( $this.hasClass('active') ) return;

			var needClass = $this.attr('class');
			$this.addClass('active').siblings().removeClass('active');

			$('.navTabs > div:visible',self.$el).fadeOut(400, function() {
				$('.navTabs .'+needClass,self.$el).fadeIn(400);
			});

			$('body,html').animate({scrollTop: 0},400);


		},

		deletePost: function(e){
			e.preventDefault();
			$('.buttons_area',this.$el).empty().append(config.loaderImg.big);
			this.writepostModel.deletePost();
		}

	});

	return writepostPageView;

})
