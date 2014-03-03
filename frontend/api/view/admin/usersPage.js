define([
	'collection/peoplesCollection',
	'backbone'
],function(peoplesCollection){

	var usersPageView = Backbone.View.extend({
		
		events: {
			'click .morePeoples': 'updateCollection',
			'click .exportExcel': 'exportExcel',
			'click .exportCSV':   'exportCSV'
		},

		initialize: function(){
			var self = this;
			_.bindAll(self);
			this.peoples_on_page = 10;
			this.$el.empty().append(config.loaderImg.big);
			$('.page_content').empty().append( this.$el );

			this.collection = new peoplesCollection(null,{type: 'adminList'});
			this.collection.updateAllUsers(this.peoples_on_page,this.render);
		},

		render: function(){
			var self = this;

			if( this.collection.length == 0 ){
				this.$el.empty().append('<h2 class="t-center">Ничего не найдено!</h2>');
				return;
			}

			this.$el.empty().append('<article class="cat-title"><h4>Экспорт</h4><div class="hr"></div></article>');
			this.$el.append('<article class="bottom-toolbar">\
				<a href="#" class="btn exportExcel">Экспорт в Excel</a>\
				<a href="#" class="btn exportCSV">Экспорт в CSV</a>\
				<h4 class="excelBock">Ссылка на скачивание excel файла: <a href=""></a></h4>\
				<div class="csvBlock">\
					<h4>CSV: </h4>\
					<textarea></textarea>\
				</div>\
			</article>');


			this.collection.on('add',this.addPeoples,this);

			this.$el.append('<article class="cat-title"><h4>Пользователи</h4><div class="hr"></div></article>'); 
			_.each(this.collection.models,function(model){ self.$el.append(model.view.$el); });
			if( !this.collection.ready ) 
				this.$el.append('<article class="bottom-toolbar moreUsersButton t-center"><a href="#" class="btn morePeoples">Больше людей</a></article>');

		},

		updateCollection: function(e){
			e.preventDefault();
			var self = this;
			this.collection.page++;
			var lastDivOffset = $('> div',this.$el).last().offset().top;

			this.collection.updateAllUsers(this.peoples_on_page,function(){ 
				if( self.collection.ready ){
					$('.moreUsersButton',self.$el).remove();
				} else {
					$('> div',self.$el).last().after( $('.moreUsersButton',self.$el) );
					$('html,body').animate({scrollTop: lastDivOffset},300);
				}
			});
		},

		addPeoples: function(model){
			var self = this;
			self.$el.append(model.view.$el);
		},

		exportExcel: function(e){
			e.preventDefault();
			var self = this;
			$.get('/admin/excel_users',function(data){
				if( data.error !== undefined && data.error == 'true') return;
				if( data.file_xls.indexOf('http://') == -1 ) 
					data.file_xls = 'http://' + data.file_xls;
				$('.excelBock a',self.$el).attr('href',data.file_xls).html(data.file_xls);
				$('.excelBock',self.$el).show();
			},'json');
		},

		exportCSV: function(e){
			e.preventDefault();
			$.get('/admin/csv_users_email',function(data){
				if( data.error !== undefined && data.error == 'true') return;
				$('.csvBlock textarea',self.$el).val(data.result);
				$('.csvBlock',self.$el).show();
			},'json');
		}


	});

	return usersPageView;

})