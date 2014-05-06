(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/SpeakerModel', 'collections/Pagination', 'backbone'], function(SpeakerModel, Pagination) {
    var SpeakerCollection;
    return SpeakerCollection = (function(_super) {
      __extends(SpeakerCollection, _super);

      function SpeakerCollection() {
        return SpeakerCollection.__super__.constructor.apply(this, arguments);
      }

      SpeakerCollection.prototype.model = SpeakerModel;

      return SpeakerCollection;

    })(Pagination);
  });

}).call(this);
