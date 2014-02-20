define([
	'text!template/peoples/peoplesPage.htm',
	'collection/industryListCollection',
	'collection/peoplesCollection',
	'text!template/post/postPreview.htm',
	'backbone'
],function(
	pageTpl,
	industryCollection,
	peoplesCollection,
	postPreviewTpl
){

	var peoplesPageView = Backbone.View.extend({

		events:{
			'click .morePeoples': 'showNextPage'
		},

		initialize: function(routerData){
			var self = this;
			var needCat = routerData.catId ? routerData.catId : 'all';

			self.routerData = routerData;

			self.$el.append( _.template(pageTpl) );
			self.$sideBar = $('.left-side .nav-cat',self.$el).empty().append(config.loaderImg.big);

			if( !window.app.collection.categoryCollection ){

				window.app.collection.categoryCollection = new industryCollection();				
				self.industryCollection = window.app.collection.categoryCollection;
				self.industryCollection.on('reset',function(){
					self.industryCollection.createFullModels();
					self.industryCollection.render();
					self.render(routerData);
				});

			} else {

				self.industryCollection = window.app.collection.categoryCollection;
				self.render(routerData);

			}

		},

		render: function(routerData){
			var self = this;

			if( routerData !== undefined )	var needCat = routerData.catId ? routerData.catId : 'all';
			else var needCat = 'all';

			if( !$('section.page_content').find('.peoplesPage').is('section') )
				$('section.page_content').empty().html(this.$el);

			this.$sideBar.empty().append( this.industryCollection.peoplesCategoryView.$el );

			self.routerData = {catId: needCat};

			self.selectNeedCat(needCat);

			$('header .people_link').addClass('active').siblings().removeClass('active');

			//window.updateScrolling();
			this.delegateEvents();

		},

		selectNeedCat: function(catId){

			$('a[catid="'+catId+'"]',this.$sideBar).addClass('active').siblings().removeClass('active');
			$('header .people_link').attr('href','/#peoples/'+catId);
			$('header .profs_link').attr('href','/#explore/'+catId+'/date');
			this.getPeopleList();

		},

		clearListBlock: function(){
			$('.peoplesList',self.$el).empty().append( config.loaderImg.big );
			$('html,body').animate({scrollTop: 0},300);
		},

		getPeopleList: function(){		

			var catId = this.routerData.catId == 'all' ? 0 : this.routerData.catId;
			var self = this;			
			var selectModel = self.industryCollection.get(catId);

			if( catId == 0 ) self.setCatTitle({ name: 'Все отрасли', description: 'Истории людей, которые любят то, что делают', id: 'all' });
			else self.setCatTitle(selectModel.attributes);

			self.clearListBlock();
			selectModel.getPeoples(function(){ self.renderPeoples( selectModel,false ) },false);	

		},

		showNextPage: function(event){
			event.preventDefault();
			var catId = this.routerData.catId == 'all' ? 0 : this.routerData.catId;
			var self = this;			
			var selectModel = self.industryCollection.get(catId);

			$('.peoplesList .morePeoples',self.$el).hide();
			$('.peoplesList .bottom-toolbar',self.$el).append( config.loaderImg.big );
			selectModel.getPeoples(function(){ self.renderPeoples( selectModel,true ) },true);
		},

		
		renderPeoples: function(catModel,scroll){
			var self = this;

			if (scroll) var lastPostEl = $('.peoplesList > div',self.$el).last().offset() ? $('.peoplesList > div',self.$el).last().offset().top-85 : 0;
			else var lastPostEl = 0;

			$('.peoplesList',this.$el).empty();

			if( catModel.peoplesCollection.models.length == 0 ){
				$('.peoplesList',self.$el).append( _.template( postPreviewTpl, {post: {type: 'emptyAuthor'} } ) );
				$('html,body').animate({scrollTop: 0},300);
				return;
			}

			_.each(catModel.peoplesCollection.models,function(model){ $('.peoplesList',this.$el).append( model.view.$el ); });

			if( !catModel.peoplesCollection.ready )
				$('.peoplesList',this.$el).append('<article class="bottom-toolbar leftM t-center"><a href="#" class="btn morePeoples">Больше людей</a></article>');
			
			$('html,body').animate({scrollTop: lastPostEl},300);	
		},

		setCatTitle: function(info){
			var self = this;
			$('.cat-title h3',self.$el).html( info.name );
			//$('.cat-title p',self.$el).html( info.description );
		}


	});


	return peoplesPageView;

})