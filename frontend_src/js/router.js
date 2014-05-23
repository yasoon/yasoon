(function() {
  define(['controller', 'admin/controller', 'backbone', 'mediator'], function(Controller, AdminController) {
    var AppRouter;
    AppRouter = Backbone.Router.extend({
      routes: {
        '': 'index',
        'posts/:category/:sort(/)': 'posts',
        'post/new(/)': 'newPost',
        'post/:id(/)': 'showPost',
        'post/:id/edit(/)': 'editPost',
        'register(/)': 'registerSpeaker',
        'speakers(/:category)(/)': 'speakers',
        'speaker/:id/:page(/)': 'showSpeaker',
        'author/edit(/)': 'editAuthor',
        'author/:page(/)': 'author',
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
      newPost: function() {
        this.isLogged();
        return Controller.newPost();
      },
      showPost: function(id) {
        return Controller.post(id);
      },
      editPost: function(id) {
        this.isLogged();
        return Controller.editPost(id);
      },
      speakers: function(category) {
        return Controller.speakers(category);
      },
      registerSpeaker: function() {
        return Controller.register();
      },
      editAuthor: function() {
        this.isLogged();
        return Controller.editAuthor();
      },
      showSpeaker: function(id, page) {
        return Controller.speaker(id, page);
      },
      author: function(page) {
        return Controller.author(page);
      },
      loadPost: function(id) {
        return this.navigate("#/post/" + id, {
          trigger: true
        });
      },
      adminMainPage: function() {
        return AdminController.index();
      },
      undefinedRoute: function() {
        return Controller.undefinedRoute();
      },
      isLogged: function() {
        if (typeof window.userId === "undefined") {
          this.navigate('#/404/');
          return Controller.undefinedRoute();
        }
      }
    });
    return new AppRouter();
  });

}).call(this);
