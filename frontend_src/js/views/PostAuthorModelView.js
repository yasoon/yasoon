(function() {
  define(['text!templates/speakerInfoTpl.htm', 'views/LoginPopUpView', 'backbone', 'mediator'], function(speakerInfoTpl, LoginPopUpView) {
    return Backbone.View.extend({
      tagName: 'aside',
      className: 'postinfo',
      template: _.template(speakerInfoTpl),
      subscriptions: {
        'question:answered': 'updateQuestionCounter'
      },
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      },
      events: function() {
        return {
          'click .js-follow': 'followSpeaker'
        };
      },
      followSpeaker: function(event) {
        event.preventDefault();
        if (typeof window.userId !== "undefined") {
          return $.post('/api/author/setFriends', {
            authorId: window.userId,
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
