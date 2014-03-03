define([

	'text!template/writepost/singlePostTpl.htm',
	'backbone'

],function(singlePostTpl){

	var singlePost = Backbone.View.extend({

		template: _.template(singlePostTpl),

		initialize: function(writePostModel){
			var self = this;
			this.writePostModel = writePostModel;
			$.get('/ajax/industry/getIndustryList.php',{},function(data){
				self.$el.append( self.template({industryList: data}) );
				self.trigger('viewReady');
			},'json')			
		}

	});

	return singlePost;

});