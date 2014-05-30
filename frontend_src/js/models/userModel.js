(function() {
  define(['backbone'], function() {
    var UserModel;
    UserModel = Backbone.Model.extend({
      url: '/api/author/getShortUserData',
      initialize: function() {
        this.deferred = $.Deferred();
        return $.get(this.url, (function(_this) {
          return function(data) {
            var admin;
            if (data) {
              _this.set(data);
              admin = _this.get('roles')[0];
              Window.config.admin = admin === "ROLE_ADMIN" ? true : false;
              Window.config.userId = _this.get('id');
              Window.config.regFrom = _this.get('regFrom');
              return _this.deferred.resolve();
            } else {
              Window.config.admin = false;
              Window.config.userId = false;
              Window.config.regFrom = _this.get('regFrom');
              return _this.deferred.resolve();
            }
          };
        })(this));
      }
    });
    return new UserModel();
  });

}).call(this);
