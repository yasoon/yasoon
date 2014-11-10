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
              window.config.admin = admin === "ROLE_ADMIN" ? true : false;
              window.config.userId = _this.get('id');
              window.config.regFrom = _this.get('regFrom');
              window.config.friends = _this.get('friends');
              return _this.deferred.resolve();
            } else {
              window.config.admin = false;
              window.config.userId = false;
              window.config.regFrom = _this.get('regFrom');
              return _this.deferred.resolve();
            }
          };
        })(this));
      }
    });
    return new UserModel();
  });

}).call(this);
