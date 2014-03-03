define([
	'text!template/autor/autor_list_template.htm',
	'text!template/admin/authorTpl.htm',
	'backbone'
],function(autorTpl,adminAuthorTpl){

	var autorView = Backbone.View.extend({

		template: _.template(autorTpl),
		
		events:{
			'click .authorDelete': 'removeAuthor',
			'click .setAdmin': 'setAdmin',
			'click .deleteAdmin': 'deleteAdmin'
		},

		initialize: function(model){
			if( this.model.collection.type == 'adminList' )
				this.$el.append( _.template(adminAuthorTpl, {autor: this.model.attributes}) );
			else
				this.$el.append( this.template({autor: this.model.toJSON()}) );
		},

		removeAuthor: function(e){
			e.preventDefault();
			var self = this;
			$.post('/admin/deleteUser',{id: this.model.get('id')},function(data){
				if( data.error !== undefined && data.error == 'true' ) return;
				config.siteStat.count_users--;
				self.$el.fadeOut(400,function(){ self.remove(); });
			})
		},

		setAdmin: function(e){
			var self = this;
			e.preventDefault();
			$.post('/admin/set_admin',{id: this.model.attributes.id},function(data){
				if( data.error !== undefined && data.error !== true ) return;
				if( data.oper == 'set'){
					$('.setAdmin',self.$el).remove();
					$('.t-center',self.$el).append('<b>Администратор</b>');
				}
			})

		},

		deleteAdmin: function(e){
			var self = this;
			e.preventDefault();
			$.post('/admin/set_admin',{id: this.model.attributes.id},function(data){
				if( data.error !== undefined && data.erro !== true ) return;
				if( data.oper == 'unset'){
					self.model.destroy();
					self.remove();
				}
			},'json')
		}

	});


	return autorView;

})