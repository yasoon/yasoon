(function() {
  define(['controller', 'admin/controller', 'models/userModel', 'backbone', 'mediator'], function(Controller, AdminController, userModel) {
    var AppRouter;
    AppRouter = Backbone.Router.extend({
      routes: {
        '': 'index',
        'posts/:category/:sort(/)': 'posts',
        'post/new(/:id)(/)': 'newPost',
        'post/:id(/)': 'showPost',
        'post/:id/edit(/)': 'editPost',
        'register(/)': 'registerSpeaker',
        'speakers(/:category)(/)': 'speakers',
        'speaker/:id/edit(/)': 'editSpeaker',
        'speaker/:id/:page(/)': 'showSpeaker',
        'timeline(/)': 'timeline',
        'about(/)': 'about',
        'admin(/)': 'adminMainPage',
        '*other': 'undefinedRoute'
      },
      initialize: function() {
        Backbone.history.start();
        return this.setHandlers();
      },
      setHandlers: function() {
        return $(document).on('click', 'a[href^="/"]', (function(_this) {
          return function(event) {
            return _this.isClicked(event);
          };
        })(this));
      },
      isClicked: function(event) {
        if (!event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey) {
          return this.linkClicked(event);
        }
      },
      linkClicked: function(event) {
        event.preventDefault();
        return this.navigate($(event.currentTarget).attr('href').replace(/^\//, ''), {
          trigger: true
        });
      },
      index: function() {
        return Controller.index();
      },
      posts: function(category, sort) {
        return Controller.posts(category, sort);
      },
      newPost: function(id) {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (_this.isUser()) {
              return Controller.newPost(id, true);
            } else if (window.newPost != null) {
              return Controller.newPost(id, true);
            } else {
              return Controller.newPost(id, false);
            }
          };
        })(this));
      },
      showPost: function(id) {
        return Controller.post(id);
      },
      editPost: function(id) {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (window.config.admin || _this.isUser()) {
              return Controller.editPost(id);
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      speakers: function(category) {
        return userModel.deferred.done((function(_this) {
          return function() {
            return Controller.speakers(category);
          };
        })(this));
      },
      registerSpeaker: function() {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (!_this.isUser()) {
              return Controller.register();
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      showSpeaker: function(id, page) {
        return userModel.deferred.done((function(_this) {
          return function() {
            return Controller.speaker(id, page);
          };
        })(this));
      },
      editSpeaker: function(id) {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (_this.isUser()) {
              return Controller.editSpeaker(id);
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      timeline: function() {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (_this.isUser()) {
              return Controller.timeline();
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      about: function() {
        return Controller.about();
      },
      adminMainPage: function() {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (window.config.admin) {
              return AdminController.index();
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      isUser: function() {
        return typeof window.config.userId === "number";
      },
      undefinedRoute: function() {
        return Controller.undefinedRoute();
      }
    });
    return new AppRouter();
  });

}).call(this);
