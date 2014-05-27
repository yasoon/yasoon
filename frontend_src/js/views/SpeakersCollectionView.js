(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/speakersStoriesTpl.htm', 'views/SpeakerPreview', 'views/PaginationView', 'backbone'], function(speakersStoriesTpl, SpeakerPreview, PaginationView) {
    var SpeakerCollectionView;
    return SpeakerCollectionView = (function(_super) {
      __extends(SpeakerCollectionView, _super);

      function SpeakerCollectionView() {
        return SpeakerCollectionView.__super__.constructor.apply(this, arguments);
      }

      SpeakerCollectionView.prototype.tagName = 'section';

      SpeakerCollectionView.prototype.template = _.template(speakersStoriesTpl);

      SpeakerCollectionView.prototype.render = function() {
        this.data = _.extend(this.options, this.options.description);
        return SpeakerCollectionView.__super__.render.apply(this, arguments);
      };

      SpeakerCollectionView.prototype.updateCounter = function(event) {
        this.updateCollection();
        return SpeakerCollectionView.__super__.updateCounter.apply(this, arguments);
      };

      SpeakerCollectionView.prototype.updateCollection = function() {
        var category, counter;
        counter = this.counter + 1;
        category = this.options.category;
        return $.get("/api/post/get_categoryPeople/" + category + "/" + counter + "/10", (function(_this) {
          return function(data) {
            data = data['peoples'];
            return _this.collection.add(data);
          };
        })(this), 'json');
      };

      SpeakerCollectionView.prototype.addOne = function(item) {
        item = new SpeakerPreview({
          model: item
        });
        return this.itemsList.append(item.render().$el);
      };

      return SpeakerCollectionView;

    })(PaginationView);
  });

}).call(this);
