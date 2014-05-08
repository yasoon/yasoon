(function() {
  define(['controller', 'backbone'], function(Controller) {
    var AppRouter;
    AppRouter = Backbone.Router.extend({
      routes: {
        '': 'index',
        'posts(/:category)(/:sort)(/)': 'posts',
        'post(/:id)(/)': 'post',
        'post-new(/)': 'newPost',
        'speakers(/:category)(/)': 'speakers',
        'speaker(/:id)(/:page)(/)': 'speaker',
        'register(/)': 'register',
        'author(/:page)(/)': 'author',
        '*other': 'undefinedRoute'
      },
      initialize: function() {
        Backbone.history.start({});
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
      post: function(id) {
        return Controller.post(id);
      },
      newPost: function() {
        return Controller.newPost();
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
      undefinedRoute: function() {
        return Controller.undefinedRoute();
      }
    });
    return new AppRouter();
  });

}).call(this);
