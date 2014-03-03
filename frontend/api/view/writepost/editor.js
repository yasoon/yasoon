define([
	'editor',
	'backbone'
],function(editorTpl){

	var textEditorView = Backbone.View.extend({

		className: 'textEditor',
		template: _.template(editorTpl),

		initialize: function(){

			this.$el.append( '<textarea class="eidtor"></textarea>' );
			var self = this;

			
				self.editor = $('.eidtor',self.$el).redactor();	
			
   
			

			
			 

		}

	});

	return textEditorView;

});