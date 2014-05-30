(function() {
  define(['text!templates/speakerInfoTpl.htm', 'views/LoginPopUpView', 'backbone', 'mediator'], function(speakerInfoTpl, LoginPopUpView) {
    return Backbone.View.extend({
      subscriptions: {
        'question:answered': 'updateQuestionCounter'
      },
      events: function() {
        return {
          'click .js-follow': 'followSpeaker'
        };
      },
      tagName: 'aside',
      className: 'postinfo',
      template: _.template(speakerInfoTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      },
      followSpeaker: function(event) {
        event.preventDefault();
        if (typeof Window.config.userId !== "undefined") {
          return $.post('/api/author/setFriends', {
            authorId: Window.config.userId,
            friend: this.model.get('id')
          }, (function(_this) {
            return function(data) {
              var text;
              text = data.type === 'add' ? 'Отписаться' : 'Подписаться';
              return _this.$(event.currentTarget).text(text);
            };
          })(this), 'json');
        } else {
          if (this.loginpopUpView == null) {
            this.loginpopUpView = new LoginPopUpView({
              model: this.model
            });
          } else {
            this.loginpopUpView.delegateEvents();
          }
          return $('body').append(this.loginpopUpView.render().$el);
        }
      },
      updateQuestionCounter: function() {
        var oldValue;
        oldValue = this.model.get('answers_count');
        this.model.set('answers_count', oldValue += 1);
        return this.render();
      }
    });
  });

}).call(this);
