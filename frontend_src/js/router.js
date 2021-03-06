(function() {
  define(['controller', 'admin/controller', 'models/userModel', 'backbone', 'mediator'], function(Controller, AdminController, userModel) {
    var AppRouter;
    AppRouter = Backbone.Router.extend({
      routes: {
        '': 'index',
        'posts/:category/:sort(/)': 'posts',
        'post/new(/:id)(/)': 'newPost',
        'review/new(/:id)(/)': 'newReview',
        'interview/:id(/)': 'showInterview',
        'interviews(/)': 'interviews',
        'post/:id(/)': 'showPost',
        'review/:id(/)': 'showReview',
        'post/:id/edit(/)': 'editPost',
        'review/:id/edit(/)': 'editReview',
        'register(/)': 'registerSpeaker',
        'speakers(/:category)(/)': 'speakers',
        'speaker/:id/edit(/)': 'editSpeaker',
        'speaker/:id/:page(/)': 'showSpeaker',
        'timeline(/)': 'timeline',
        'about(/)': 'about',
        'rules(/)': 'rules',
        'admin(/)': 'adminMainPage',
        '*other': 'undefinedRoute'
      },
      initialize: function() {
        Backbone.history.start();
        this.bind('route', this.sendPageview);
        Backbone.history.on("route", this.sendPageview());
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
        if (window.reloadMainPage != null) {
          return window.location.reload(true);
        } else {
          return Controller.index();
        }
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
      newReview: function(id) {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (_this.isUser()) {
              return Controller.newReview(id, true);
            } else if (window.newReview != null) {
              return Controller.newReview(id, true);
            } else {
              return Controller.newReview(id, false);
            }
          };
        })(this));
      },
      showPost: function(id) {
        return Controller.post(id);
      },
      showReview: function(id) {
        return Controller.review(id);
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
      editReview: function(id) {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (window.config.admin || _this.isUser()) {
              return Controller.editReview(id);
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
      rules: function() {
        return Controller.rules();
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
      showInterview: function(id) {
        return Controller.interview(id);
      },
      interviews: function() {
        return Controller.interviews();
      },
      undefinedRoute: function() {
        return Controller.undefinedRoute();
      },
      sendPageview: function() {
        var url;
        url = Backbone.history.getFragment();
        return ga('send', 'pageview', {
          'page': '/#/' + url
        });
      }
    });
    return new AppRouter();
  });

}).call(this);
