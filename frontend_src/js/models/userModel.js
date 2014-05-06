(function() {
  define(['backbone'], function() {
    var UserModel;
    UserModel = Backbone.Model.extend({
      url: '/api/author/getShortuserData',
      initialize: function() {
        this.deferred = $.Deferred();
        return $.get(this.url, (function(_this) {
          return function(data) {
            _this.set(data.userData);
            _this.deferred.resolve();
            return window.userId = _this.get('id');
          };
        })(this));
      }
    });
    return new UserModel();
  });

}).call(this);
