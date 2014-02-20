define([
	'view/autor/sideBarAutor_view',
	'view/autor/autor_listType_view',
	'backbone'
],function(sideBarAutorView,listType_view){

	var autorModel = Backbone.Model.extend({

		url: '/api/author/getAuthorInfo',

		initialize: function(model,options){
			var self = this;
			self.options = options || {needView: true};
			this.pagePostLimit = 10;
			this.postsReady = false;
			this.questionsReady = false;

			_.bindAll(self);

			if( this.attributes.type == 'new' ){

				this.createNewUser();

			} else {

				if( this.attributes.name !== undefined ){

					this.updateModel();

				} else {

					if( this.attributes.id !== undefined ){

						this.fetch({
							data: {autor_id: this.get('id') }, 
							type:'POST',
							success: self.updateModel
						});

					} else {

						alert('Пользователь не определен!');

					}
				}
			}

		}, 

		updateModel: function(){
			
			var self = this;
			if( self.get('last_publish_date') ){
				var dateArr = self.get('last_publish_date').split('/');
				var needDate = new Date( parseInt(dateArr[2]),parseInt((dateArr[1]-1)),parseInt(dateArr[0]) );
				var dateText = dateArr[0]+' '+needDate.getMonthName()+' '+dateArr[2];

				self.set('publishDateText', dateText);
				self.set('formatDate',needDate);
			}

			if( self.get('date_reg') ){
				var dateReg = self.get('date_reg').split(' ');
				var dateArr = dateReg[0].split('-');
				var needDate = new Date( parseInt(dateArr[0]),parseInt((dateArr[1]-1)),parseInt(dateArr[2]) );
				var dateText = dateArr[2]+' '+needDate.getMonthName()+' '+dateArr[0]+' в '+dateReg[1];

				self.set('publishDateText', dateText);
				self.set('formatDate',needDate);
			}

			if( self.get('avatarImg') == null || self.get('avatarImg') == undefined )
				self.set('avatarImg','/upload/avatar/noAvatar.jpg');
			else
				self.set( 'avatarImg', '/upload/avatar/'+self.get('avatarImg') );

			if( self.get('interviewCaption') == null || self.get('interviewCaption') == undefined  || self.get('interviewCaption') == '')
				self.set('interviewCaption','Ничего не расказал(ла) о себе.');

			
			if( self.get('self_link') !== undefined ){
				if( self.get('self_link') !== '' && self.get('self_link') !== null){
					if( self.get('self_link').indexOf('http://') == -1 ) self.set('self_link', 'http://'+self.get('self_link'));

					var linkText = self.get('self_link');
					self.set('linkClass','ws');
					if( linkText.indexOf('vk.com') !== -1 ) self.set('linkClass','wb');
					if( linkText.indexOf('facebook.com') !== -1 ) self.set('linkClass','wf');
				}
			}


			if( self.get('answers') !== null && self.get('answers') !== undefined ){


			}


			if( self.options.needView !== false ){
				if( self.collection ) self.view = new listType_view({model: self});
				else self.view = new sideBarAutorView({model: self});
			}

		},

		createNewUser: function(){
			var self = this,
				modelData = this.attributes;

			$.post('/api/author/register',
				{
					username: modelData.name, 
					email: modelData.email,
					password: modelData.password,
					subscribe: modelData.subscribe
				},
				function(data){
					if( !data.error ){
						self.set('id',data.userId);
						self.trigger('registerCallback');
					} else {
						if( data.errorType == 'emailExist' ) var message = 'Уже есть зарегестрированый пользователь с таким e-mail.';
						if( data.errorType == 'userExist' ) var message = 'Уже есть зарегестрированый пользователь с таким именем.';

						window.app.view.messageView.render('Ошибка',message);
					}
				},
				'json'
			)

		}

		
	});

	return autorModel;

})