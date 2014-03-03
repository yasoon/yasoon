define([
	'collection/admin/interviewCollection',
	'backbone'
],function(interviewCollection){

	var interviewPage = Backbone.View.extend({
		events:{
			'click .addInterview': 'createNewInterview'
		},
		initialize: function(){
			this.$el.empty().append(config.loaderImg.big);
			$('.page_content').empty().append( this.$el );
			this.collection = new interviewCollection(null,this);
			this.listenTo(this.collection,'reset',this.render);
		},
		render: function(){
			var self = this;

			this.$el.empty();
			if( this.collection.length == 0 ){
				this.$el.append('<h2>Вопросы в анкете не найдены!</h2>');
				return;
			}

			_.each(this.collection.models,function(interviewModel){ self.$el.append(interviewModel.view.$el); })
			this.$el.append('<article class="bottom-toolbar t-center"><a href="#" class="btn addInterview">Добавить анкету</a></article>');
		},

		createNewInterview: function(e){
			e.preventDefault();
			this.collection.add({type: 'new'});
		}
	});

	return interviewPage;

})