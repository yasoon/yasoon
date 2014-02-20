define([

	'text!template/explore/explorePage.htm',
	'collection/industryListCollection',
	'collection/postsPreview_collection',
	'text!template/post/postPreview.htm',
	'backbone'

],function(
	explorePageTpl,
	industryCollection,
	postsCollection,
	postPreviewTpl
){

	var explorePageView = Backbone.View.extend({

		events: {
			'click .navigate a': 'showTab',
			'click .morePosts': 'showNextPage'
		},

		initialize: function(routerData){

			var self = this;
			var needCat = routerData.catId ? routerData.catId : 'all';
			var needSort  = routerData.sortType ? routerData.sortType : 'date';

			self.routerData = routerData;
			self.selectSort = false;
			self.nowCatId = false;
			self.pagePostLimit = 10; // Лимит вывода постов за один раз

			self.$el.append( _.template( explorePageTpl ) );

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

		render: function(options){
		
			if( options !== undefined ){
				var needCat = options.catId ? options.catId : 'all';
				var needSort  = options.sortType ? options.sortType : 'date';
			} else {
				var needCat = 'all';
				var needSort = 'date';
			}
			
			if( !$('section.page_content').find('.explorePage').is('section') )
				$('section.page_content').empty().html(this.$el);

			this.$sideBar.empty().append( this.industryCollection.postsCategoryView.$el );
			
			if( this.nowCatId == needCat && !this.selectSort)
				$('.navigate a.active',this.$el).siblings().click();

			self.routerData = {
				catId: needCat,
				sortType: needSort
			};

			if( !this.selectSort && this.nowCatId !== needCat )
				this.selectNeedCat(needCat);

			$('header .profs_link').addClass('active').siblings().removeClass('active');

			//window.updateScrolling();

			this.delegateEvents();
							
		},

		selectNeedCat: function(catId){

			this.nowCatId = catId;
			this.routerData.catId = catId;	
			$('a[catid="'+catId+'"]',this.$sideBar).addClass('active').siblings().removeClass('active');
			$('header .profs_link').attr('href','/#explore/'+catId+'/'+self.routerData.sortType);
			$('header .people_link').attr('href','/#peoples/'+catId);
			this.getPostList();

		},

		getPostList: function(event){

			var catId = this.routerData.catId == 'all' ? 0 : this.routerData.catId;
			var self = this;			
			var selectModel = self.industryCollection.get(catId);

			if( catId == 0 ) 
				self.setCatTitle({ name: 'Все отрасли', description: 'Истории людей, которые любят то, что делают', id: 'all' });
			else 
				self.setCatTitle(selectModel.toJSON());	

			self.clearListBlock();
			selectModel.getPosts(function(){ self.renderPosts(selectModel,this.routerData.sortType,false); },false)				

		},

		clearListBlock: function(){
			$('.nav-tabs .byDate, .nav-tabs .byRate',self.$el).empty().append( config.loaderImg.big );
			$('html,body').animate({scrollTop: 0},300);
		},

		showNextPage: function(e){

			if( event ) event.preventDefault();
			var catId = this.routerData.catId == 'all' ? 0 : this.routerData.catId;
			var self = this;			
			var selectModel = self.industryCollection.get(catId);

			$('.nav-tabs .byDate .morePosts, .nav-tabs .byRate .morePosts',self.$el).hide();
			$('.nav-tabs .byDate .bottom-toolbar, .nav-tabs .byRate .bottom-toolbar',self.$el).append( config.loaderImg.big );
			selectModel.getPosts(function(){ self.renderPosts(selectModel,this.routerData.sortType,true); },true);
		},

		renderPosts: function(catModel,sortType, scroll){

			var self = this;
			
			if (scroll) var lastPostEl = $('.nav-tabs .byDate > div',self.$el).last().offset() ? $('.nav-tabs .byDate > div',self.$el).last().offset().top : 0;
			else var lastPostEl = 0;
			$('.nav-tabs .byDate, .nav-tabs .byRate',self.$el).empty();

			if( catModel.postsCollection.dateSortCollection.models.length > 0 ){

				_.each(catModel.postsCollection.dateSortCollection.models, function(postD){
					$('.nav-tabs .byDate',self.$el).append( postD.view.$el );
				});

				_.each(catModel.postsCollection.rateSortCollection.models, function(postR){
					$('.nav-tabs .byRate',self.$el).append( postR.view.$el );
				});

				if( !catModel.postsCollection.ready )
					$('.nav-tabs .byDate, .nav-tabs .byRate',self.$el).append('<article class="bottom-toolbar leftM t-center"><a href="#" class="btn morePosts">Больше историй</a></article>');
				
				$('html,body').animate({scrollTop: lastPostEl},400);

			} else {
				
				$('.nav-tabs .byDate, .nav-tabs .byRate',self.$el).empty().append( _.template( postPreviewTpl, {post: {type: 'empty'} } ) );

			}

			if( sortType == 'date' ){

				$('.navigate a.byDate',self.$el).addClass('active').siblings().removeClass('active');
				$('.nav-tabs .byDate',self.$el).show().siblings().hide();

			} else {

				$('.navigate a.byRate',self.$el).addClass('active').siblings().removeClass('active');
				$('.nav-tabs .byRate',self.$el).show().siblings().hide();

			}

			

		},

		showTab: function(event){
			var self = this;
			var $this = $(event.currentTarget);
			if( $this.hasClass('active') ) return;
			self.selectSort = true;

			var $needBlock = $('.nav-tabs .'+$this.attr('class'),self.$el);
			$this.addClass('active').siblings().removeClass('active');
			$needBlock.siblings().fadeOut(300, function() {	$needBlock.fadeIn(300, function(){ self.selectSort = false; });	});

		},

		setCatTitle: function(info){
			var self = this;
			$('.cat-title h3',self.$el).html( info.name );
			//$('.cat-title p',self.$el).html( info.description );
			$('.navigate a.byDate',self.$el).attr( 'href', '/#explore/'+info.id+'/date' );
			$('.navigate a.byRate',self.$el).attr( 'href', '/#explore/'+info.id+'/rate' );
		}

	})

	return explorePageView;

})