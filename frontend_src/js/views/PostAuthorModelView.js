(function() {
  define(['text!templates/speakerInfoTpl.htm', 'views/LoginPopUpView', 'models/userModel', 'models/PostAuthorModel', 'backbone', 'mediator'], function(speakerInfoTpl, LoginPopUpView, userModel, PostAuthorModel) {
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
        if (typeof Window.config.userId === "number") {
          return $.post('/api/author/setFriends', {
            authorId: Window.config.userId,
            friend: this.model.get('id')
          }, (function(_this) {
            return function(data) {
              var target, text;
              text = data.type === 'add' ? 'Отписаться' : 'Подписаться';
              target = _this.$(event.currentTarget);
              target.text(text);
              if (data.type === 'add') {
                return target.addClass('color-red');
              } else {
                return target.removeClass('color-red');
              }
            };
          })(this), 'json');
        } else {
          if (this.loginpopUpView == null) {
            this.loginpopUpView = new LoginPopUpView({
              model: new PostAuthorModel()
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
