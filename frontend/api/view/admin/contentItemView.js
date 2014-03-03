define([
	'text!template/admin/contentItemTpl.htm',
	'backbone'
],function(contentItemTpl){

	var contentItemView = Backbone.View.extend({
		template: _.template(contentItemTpl),
		tagName: 'article',
		className: 'contentItem',
		events: {
			'click .editable': 'openEditArea',
			'click .cancle': 'closeEditArea',
			'click .saveContent': 'saveContent',
			'click .delete': 'deleteContent'
		},
		initialize: function(){
			this.$el.append(this.template(this.model.attributes));	
			this.$contentArea = $('.content',this.$el);		
			this.$editArea = $('.editArea',this.$el);		
		},

		openEditArea: function(){
			this.$contentArea.hide();
			this.$editArea.show();
		},

		closeEditArea: function(e){
			if( e !== undefined ) e.preventDefault();
			if( this.model.attributes.type == 'new' ){
				this.model.destroy();
				return;
			}
			this.$contentArea.show();
			this.$editArea.hide();
		},

		saveContent: function(e){
			e.preventDefault();
			if( this.model.attributes.type == 'new' ){
				this.createContent();
				return;
			}
			var description = $('[name="description"]',this.$el).val(),
			    text = $('[name="text"]',this.$el).val(),
			    self = this;

			this.model.set('text',text);
			this.model.set('description',description);


			$.post('/api/content/edit',{model: this.model.attributes},function(data){
				if( data.error !== undefined && data.error == true ){
					self.closeEditArea();
					return;
				}
				//self.model.set('type','notEmpty');
				//self.model.set('id',data.id);
				$('h4 b',self.$contentArea).html(description);
				$('p',self.$contentArea).html(text);
				//$('b',self.$contentArea).first().html('id: '+data.id);


				self.closeEditArea();				

			});

		},

		createContent: function(e){
			if( e !== undefined ) e.preventDefault();
			var description = $('[name="description"]',this.$el).val(),
			    text = $('[name="text"]',this.$el).val(),
			    self = this;

			this.model.set('text',text);
			this.model.set('description',description);


			$.post('/api/content/add',{model: this.model.attributes},function(data){
				if( data.error !== undefined && data.error == true ){
					self.closeEditArea();
					return;
				}
				self.model.set('type','notEmpty');
				self.model.set('id',data.id);
				$('h4 b',self.$contentArea).html(description);
				$('p',self.$contentArea).html(text);
				$('b',self.$contentArea).first().html('id: '+data.id);
				self.$editArea.append('<a href="#" class="btn delete">Удалить</a>');


				self.closeEditArea();				

			});
		},

		deleteContent: function(e){
			e.preventDefault();
			var self = this;
			$.post('/api/content/delete',{id: this.model.attributes.id},function(data){
				if( data.error !== undefined && data.error == true ){
					self.closeEditArea();
					return;
				}
				self.model.destroy();
			},'json')
		}


	});

	return contentItemView;

})