(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/authorPageTpl.htm', 'backbone'], function(authorPageTpl) {
    var AuthorNavigationView;
    return AuthorNavigationView = (function(_super) {
      __extends(AuthorNavigationView, _super);

      function AuthorNavigationView() {
        return AuthorNavigationView.__super__.constructor.apply(this, arguments);
      }

      AuthorNavigationView.prototype.tagName = 'section';

      AuthorNavigationView.prototype.className = 'lim';

      AuthorNavigationView.prototype.template = _.template(authorPageTpl);

      AuthorNavigationView.prototype.initialize = function(options) {
        return this.options = options || {};
      };

      AuthorNavigationView.prototype.render = function() {
        this.$el.append(this.template(this.options));
        this.$("#" + this.options.page).addClass('active');
        return this;
      };

      return AuthorNavigationView;

    })(Backbone.View);
  });

}).call(this);
