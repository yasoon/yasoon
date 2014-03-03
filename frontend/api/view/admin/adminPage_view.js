define([
	'view/admin/adminRouter',
	'text!template/admin/adminHeader.htm',
	'backbone'
],function(adminRouter,adminHeaderTpl){

	var adminPageView = Backbone.View.extend({

		initialize: function(){
			
			$('header').empty().addClass('log-in').append(_.template(adminHeaderTpl));

		}

	});


	return adminPageView;

})