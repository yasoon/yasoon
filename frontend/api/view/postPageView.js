define([
	'text!template/post/postPageTpl.htm',
	'model/post/post_model',
	'backbone'

],function(pageTpl, postModel){

	var postPageView = Backbone.View.extend({

		template: _.template(pageTpl),

		initialize: function(routerData){

			var self = this;
			self.$el.append( self.template() );
			$('.postinfo, .postTextBlock',this.$el).append(config.loaderImg.big);
			self.getPost(routerData);
		},

		getPost: function(routerData){
			var self = this;
			self.getPostInfo(routerData.postId,function(model){
				if( model.length == undefined ){
					self.render(true);
					return;
				}
				self.model = new postModel(model[0],{postType : 'fullPost'});
				console.log(self.model);
				self.render(false);
			});
			
		},

		render: function(empty){
			if( !$('section.page_content').find('.postPage').is('section') )
				$('section.page_content').empty().html(this.$el);

			if( empty ){
				window.location = '/#404';
			} else {
				$('.postTextBlock',this.$el).empty().append( this.model.view.$el );
				$('.postinfo',this.$el).empty().append( this.model.autorModel.view.$el );	
			}					

		},

		getPostInfo: function(postId,callBack){
			$.post('/api/post/getPost',{postType: 'needPost', postid: postId},callBack,'json');
		}

	});

	return postPageView;

})