(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/postPageTpl.htm', 'backbone'], function(postPageTpl) {
    var PostPageModelView;
    return PostPageModelView = (function(_super) {
      __extends(PostPageModelView, _super);

      function PostPageModelView() {
        return PostPageModelView.__super__.constructor.apply(this, arguments);
      }

      PostPageModelView.prototype.tagName = 'article';

      PostPageModelView.prototype.className = 'lim';

      PostPageModelView.prototype.template = _.template(postPageTpl);

      PostPageModelView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      return PostPageModelView;

    })(Backbone.View);
  });

}).call(this);
