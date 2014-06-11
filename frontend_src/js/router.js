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
        'speaker/:id/:page(/)': 'showSpeaker',
        'author/edit(/)': 'editAuthor',
        'author/:page(/)': 'author',
        'timeline(/)': 'timeline',
        'admin(/)': 'adminMainPage',
        '*other': 'undefinedRoute'
      },
      initialize: function() {
        Backbone.history.start({});
        Backbone.Mediator.subscribe('post:submitted', this.loadPost, this);
        return $(document).on('click', 'a[href^="/"]', (function(_this) {
          return function(event) {
            var url;
            if (!event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey) {
              event.preventDefault();
              url = $(event.currentTarget).attr('href').replace(/^\//, '');
              return _this.navigate(url, {
                trigger: true
              });
            }
          };
        })(this));
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
            if (typeof Window.config.userId === "number") {
              return Controller.newPost(id);
            } else {
              return _this.navigate('#/404');
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
            if (Window.config.admin || typeof Window.config.userId === "number") {
              return Controller.editPost(id);
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      speakers: function(category) {
        return Controller.speakers(category);
      },
      registerSpeaker: function() {
        return Controller.register();
      },
      editAuthor: function() {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (typeof Window.config.userId === "number") {
              return Controller.editAuthor();
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      showSpeaker: function(id, page) {
        return Controller.speaker(id, page);
      },
      author: function(page) {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (typeof Window.config.userId === "number") {
              return Controller.author(page);
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      loadPost: function(id) {
        return this.navigate("#/post/" + id, {
          trigger: true
        });
      },
      adminMainPage: function() {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (Window.config.admin) {
              return AdminController.index();
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      timeline: function() {
        return userModel.deferred.done((function(_this) {
          return function() {
            if (Window.config.userId === "number") {
              return Controller.timeline();
            } else {
              return _this.navigate('#/404');
            }
          };
        })(this));
      },
      undefinedRoute: function() {
        console.log("undefined route");
        return Controller.undefinedRoute();
      }
    });
    return new AppRouter();
  });

}).call(this);
