(function() {
  define(['backbone'], function() {
    var UserModel;
    UserModel = Backbone.Model.extend({
      url: '/api/author/getShortuserData',
      initialize: function() {
        this.deferred = $.Deferred();
        return $.get(this.url, (function(_this) {
          return function(data) {
            var admin;
            if (data.userData) {
              _this.set(data.userData);
              admin = _this.get('roles')[0];
              Window.config.admin = admin === "ROLE_ADMIN" ? true : false;
              Window.config.userId = _this.get('id');
              return _this.deferred.resolve();
            } else {
              Window.config.admin = false;
              Window.config.userId = false;
              return _this.deferred.resolve();
            }
          };
        })(this));
      }
    });
    return new UserModel();
  });

}).call(this);
