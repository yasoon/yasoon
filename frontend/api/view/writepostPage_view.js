define([
	'text!template/writepost/pageTpl.htm',
	'collection/newPostQuestionsCollection',
	'model/writepost/writepost_model',
	'backbone'

],function(pageTpl,questionCollection,writepostModel){

	var writepostPageView = Backbone.View.extend({

		template: _.template(pageTpl),

		events: {
			'keydown [data-field="postDescription"]': 'simvolCalk',
			'click .navigate a': 'showTab',
			'click .select [type="checkbox"]': 'catSelect',
			'click .savePost': 'savePost',
			'click [data-field]': 'removeErrors'
		},

		initialize: function(model,routerData){
			var self = this;

			this.interviewId = routerData.interviewId;	
			if( !app.userModel.attributes.userData ){
				$('section.page_content').empty().html('<h2>Не авторизированые пользователи не могут создавать истории.</h2>');
				return;
			}

			$.get('/api/category/get_CategoryList',{},function(data){
				self.$el.append( self.template({industryList: data}) );
				self.$questionListBlock = $('.questions_list',this.$el);
				self.writepostModel = new writepostModel();
				self.questionCollection = new questionCollection(null,{ writePostModel: self.writepostModel, view: self, interviewId: self.interviewId });
				self.listenTo(self.questionCollection, 'questionsReady',function(){ 
					$('.questions_list .loaderConteiner',self.$el).remove();
					$('.questions_list').sortable({ handle: '.a-quertion' });
				});
				self.render();
			},'json');					
			
		},		

		render: function(){
			if( !$('section.page_content').find('.writePost').is('section') ){
				$('section.page_content').empty().html(this.$el);
				$('.select',this.$el).multiselect();
				this.delegateEvents();
				$('.questions_list',this.$el).append(config.loaderImg.big);
			}
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
				app.view.messageView.render('','Вы не написали ответа ни на один вопрос.');
				errors = true;
			}

			if( !errors ){
				this.writepostModel.set('postTitle',$('[data-field="postTitle"]',this.$el).val());
				this.writepostModel.set('postDescription',$('[data-field="postDescription"]',this.$el).val());
				$('.btn.savePost',self.$el).after(config.loaderImg.big);
				$('.btn.savePost',self.$el).remove();
				this.writepostModel.savePost(); 
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

		simvolCalk: function(e){
			var $this = $(e.currentTarget);
				check = $this.val().length;
				maxlenghth = 255;

				result = maxlenghth - check;
				this.$el.find('.symbols_count b').html(result);
				
						

		}
	});

	return writepostPageView;

})
