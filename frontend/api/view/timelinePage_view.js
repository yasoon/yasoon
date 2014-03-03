define([
	'collection/timelineCollection',	
	'text!template/timeline/timelinePageTpl.htm',
	'backbone'

],function(timelineCollection,pageTpl){

	var timelinePageView = Backbone.View.extend({

		template: _.template(pageTpl),

		initialize: function(){
			var self = this;
			self.currentUser = app.userModel.attributes.userData;

			this.render();

			if( self.currentUser == false ){
				$('.timelineList',this.$el).empty().append('<article><h2>Для того что бы увидить свою ленту новостей вы должны авторизироваться!</h2></article>');
				return;
			}

			this.collection = new timelineCollection();
			this.listenTo(this.collection,'readyCollection',this.renderList);

		
		},

		render: function(){
			if( !$('section.page_content').find('.timeLinePage').is('section') ){
				this.$el.append( this.template() );
				$('.timelineList',this.$el).empty().append(config.loaderImg.big);
				$('section.page_content').empty().html(this.$el);									
			}
		},

		renderList: function(){
			var self = this;
			$('.timelineList',self.$el).empty();
			$.post('/api/author/clearTimeline',{type: 'all', authorId: app.userModel.attributes.userData.id},function(){
				app.userModel.attributes.userData['timeline']['answers_count'] = 0;
				app.userModel.attributes.userData['timeline']['posts_count'] = 0;
				app.userModel.renderLogin();
			},'json');

			if( this.collection.models.length == 0 ){
				$('.timelineList',self.$el).append('<article><h2>'+config.getContent(56)+'</h2></article>');
				return;
			}

			_.each(this.collection.models, function(timelineModel){
				$('.timelineList',self.$el).append(timelineModel.view.$el);
			});	
		}


	});


	return timelinePageView;


})