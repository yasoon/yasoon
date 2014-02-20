define([
	'text!template/mainPage/mainPage.htm',
	'model/post/post_model',
	'collection/postsPreview_collection',
	'backbone'

],function(mainTmpl,postModel,postCollection){

	var mainPageView = Backbone.View.extend({

		template: _.template(mainTmpl),

		events: {
			'click .navigate a': 'showTab'
		},

		initialize: function(){
			var self = this;
			this.$el.append( self.template() );
			
			$.ajax({
				url: '/api/post/get_daystory',
				success: function(data){
					data['type'] = 'dayStory';
					self.dayStoryModel = new postModel(data);
					self.dayStoryModel.view.$el.appendTo( $('.mainPage_tabs .dayStory',self.$el) );
				},
				type: 'GET',
				dataType: 'json'
			 }
			);

			$.get('/api/post/get_best_posts',
				function(data){
					self.bestStoriesCollection = new postCollection(data,{type: 'bestStories'});
					self.bestStoriesCollection.render().$el.appendTo( $('.mainPage_tabs .best_stories',self.$el) );
				},
				'json'
			)

			self.render();			
		},

		render: function(){
			$('section.page_content').empty().html(this.$el);
			this.delegateEvents();
			this.$pageTabs = $('.mainPage_tabs');
			//window.updateScrolling();
			return self;
		},

		showTab: function(event){
			var self = this;
			event.preventDefault();
			var $this = $(event.currentTarget);
			if( $this.hasClass('active') ) return false;

			var needClass = $this.attr('class');
			$this.addClass('active').siblings().removeClass('active');
			


			$('.'+needClass,self.$pageTabs).siblings().fadeOut('fast', function() {
				$('.'+needClass,self.$pageTabs).fadeIn('fast',function(){
					var needPos = $this.offset().top;
					$('html,body').animate({scrollTop: needPos},400);
				});	

				if( needClass == 'best_stories' ) $('#main-layout').addClass('m-page');
				else $('#main-layout').removeClass('m-page');				

			});


		}

	});


	return mainPageView;




})