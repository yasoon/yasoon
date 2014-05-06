(function() {
  define(['text!templates/writePostFormTpl.htm', 'backbone', 'stickit', 'mediator'], function(registerTpl) {
    return Backbone.View.extend({
      events: function() {
        return {
          'click #register': 'registerAction',
          'click #update': 'updateAction',
          'click .nav': 'goToStep'
        };
      },
      bindings: {
        '#postDescription': 'postDescription',
        '#postTile': 'postTile'
      },
      className: 'page-layout m-page',
      tagName: 'section',
      template: _.template(registerTpl),
      initialize: function() {
        this.handler();
        return this.model.set('maxLength', 290);
      },
      handler: function() {
        return this.listenTo(this.model, 'change:postDescription', this.symbolsCounter);
      },
      ui: function() {
        return this.ui = {
          counter: this.$('.counter')
        };
      },
      render: function() {
        this.$el.empty().append(this.template(this.model.toJSON()));
        this.onRender();
        return this;
      },
      onRender: function() {},
      showErrors: function(errors) {
        return _.each(errors, function(error) {
          return this.$el.find('#' + error.name).closest('.form-group').removeClass('has-success').addClass('has-error').find('.help-block').text(error.message);
        }, this);
      },
      hideErrors: function() {
        return this.$('.form-group').removeClass('has-error').addClass('has-success').find('.help-block').text('');
      },
      symbolsCounter: function(model, value) {
        var length;
        length = model.get('maxLength') - value.length;
        return this.ui.counter.text(length);
      }
    });
  });

}).call(this);
