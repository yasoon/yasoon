(function() {
  define(['controller', 'backbone', 'mediator'], function(Controller) {
    var AppRouter;
    AppRouter = Backbone.Router.extend({
      routes: {
        '': 'index',
        'posts(/:category)(/:sort)(/)': 'posts',
        'post(/:id)(/:edit)(/)': 'post',
        'speakers(/:category)(/)': 'speakers',
        'speaker(/:id)(/:page)(/)': 'speaker',
        'register(/)': 'register',
        'author(/:page)(/)': 'author',
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
      post: function(id, edit) {
        if (id === 'new') {
          return Controller.newPost();
        } else {
          if (edit) {
            return Controller.editPost(id);
          } else {
            return Controller.post(id);
          }
        }
      },
      speakers: function(category) {
        return Controller.speakers(category);
      },
      speaker: function(id, page) {
        return Controller.speaker(id, page);
      },
      register: function() {
        return Controller.register();
      },
      author: function(page) {
        return Controller.author(page);
      },
      loadPost: function(id) {
        return this.navigate("#/post/" + id, {
          trigger: true
        });
      },
      undefinedRoute: function() {
        return Controller.undefinedRoute();
      }
    });
    return new AppRouter();
  });

}).call(this);
