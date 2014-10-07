(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/speakerInfoTpl.htm', 'views/LoginPopUpView', 'models/userModel', 'models/PostAuthorModel', 'backbone', 'mediator'], function(speakerInfoTpl, LoginPopUpView, userModel, PostAuthorModel) {
    var PostAuthorModelView;
    return PostAuthorModelView = (function(_super) {
      __extends(PostAuthorModelView, _super);

      function PostAuthorModelView() {
        return PostAuthorModelView.__super__.constructor.apply(this, arguments);
      }

      PostAuthorModelView.prototype.subscriptions = {
        'question:answered': 'updateQuestionCounter'
      };

      PostAuthorModelView.prototype.events = function() {
        return {
          'click .js-follow': 'followSpeaker'
        };
      };

      PostAuthorModelView.prototype.tagName = 'aside';

      PostAuthorModelView.prototype.className = 'postinfo';

      PostAuthorModelView.prototype.template = _.template(speakerInfoTpl);

      PostAuthorModelView.prototype.initialize = function() {
        this.author = Window.config.userId;
        return this.model.set('isAuthor', this.isAuthor());
      };

      PostAuthorModelView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      PostAuthorModelView.prototype.isAuthor = function() {
        return this.author === parseInt(this.model.get('id'));
      };

      PostAuthorModelView.prototype.followSpeaker = function(event) {
        event.preventDefault();
        if (typeof this.author === "number") {
          return this.setFriends(event);
        } else {
          return this.showPopUp();
        }
      };

      PostAuthorModelView.prototype.setFriends = function(event) {
        return $.post('/api/author/setFriends', {
          authorId: this.author,
          friend: this.model.get('id')
        }, (function(_this) {
          return function(data) {
            return _this.changeButtonType(data.type, _this.$(event.currentTarget));
          };
        })(this));
      };

      PostAuthorModelView.prototype.changeButtonType = function(type, target) {
        if (type === 'add') {
          target.addClass('color-red').text('Отписаться');
        } else {
          target.removeClass('color-red').text('Подписаться');
        }
        return this.changeStatus(type);
      };

      PostAuthorModelView.prototype.changeStatus = function(type) {
        if (type === 'add') {
          return this.addToFriends();
        } else {
          return this.removeFromFriends();
        }
      };

      PostAuthorModelView.prototype.addToFriends = function() {
        return Window.config.friends.push({
          'id': this.model.get('id'),
          'date': new Date()
        });
      };

      PostAuthorModelView.prototype.removeFromFriends = function() {
        return Window.config.friends = $.grep(Window.config.friends, (function(_this) {
          return function(object) {
            return object.id !== _this.model.get('id');
          };
        })(this));
      };

      PostAuthorModelView.prototype.showPopUp = function() {
        userModel = new PostAuthorModel();
        if (this.loginpopUpView == null) {
          this.loginpopUpView = new LoginPopUpView({
            model: userModel
          });
        } else {
          this.loginpopUpView.delegateEvents();
        }
        return $('body').append(this.loginpopUpView.render().$el);
      };

      PostAuthorModelView.prototype.updateQuestionCounter = function() {
        var oldValue;
        oldValue = this.model.get('answers_count');
        this.model.set('answers_count', oldValue += 1);
        return this.render();
      };

      return PostAuthorModelView;

    })(Backbone.View);
  });

}).call(this);
