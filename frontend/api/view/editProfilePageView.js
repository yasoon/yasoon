define([
	'text!template/profile/editProfilePage.htm',
	'view/forms/editProfileForm_view',
	'backbone'
],function(pageTpl,editProfile_view, registerForm_view){
	var editProfilePage = Backbone.View.extend({

		template: _.template(pageTpl),

		initialize: function(options){

			this.$el.append( this.template() );
			this.formView = new editProfile_view({pageType: options.pageType});
			this.render();
		},

		render: function(){
			$('section.page_content').empty().html(this.$el);
			$('section.editProfile').empty().append(this.formView.$el);

			$('#fileupload').fileupload({
		        dataType: 'json',
		        autoUpload: true,
		        number: 1,
		        start: function(){
		        	$(".files_success_upload",self.$el).empty().append(config.loaderImg.small);	
		        },
		        done: function(e, data) {
		          var fileName = data.result.dir + data.result.file_name;
		          $(".files_success_upload",self.$el).empty().append('<img src="' + fileName + '" width="53" height="53" alt="Ваш аватар" />');
		          $('header .loginned > a img').attr('src',fileName);
		        }
		     });
		}

	});

	return editProfilePage;
})