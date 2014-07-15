(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/CategoriesListView', 'views/SpeakersCollectionView', 'views/EmptyView', 'collections/CategoryCollection', 'collections/SpeakersCollection', 'backbone'], function(CategoriesListView, SpeakersCollectionView, EmptyView, CategoryCollection, SpeakersCollection) {
    var SpeakersPageView;
    return SpeakersPageView = (function(_super) {
      __extends(SpeakersPageView, _super);

      function SpeakersPageView() {
        return SpeakersPageView.__super__.constructor.apply(this, arguments);
      }

      SpeakersPageView.prototype.tagName = 'section';

      SpeakersPageView.prototype.className = 'page-layout';

      SpeakersPageView.prototype.initialize = function(options) {
        this.model.set({
          'category': options.category
        });
        this.setListeners();
        return this.getCategoryList();
      };

      SpeakersPageView.prototype.setListeners = function() {
        this.listenTo(this.model, 'change:categoryList', this.createCategoryFilter);
        this.listenTo(this.model, 'change:description', this.getSpeakersList);
        return this.listenTo(this.model, 'change:speakersList', this.createSpeakersList);
      };

      SpeakersPageView.prototype.getCategoryList = function() {
        return this.model.set('categoryList', Window.config.category);
      };

      SpeakersPageView.prototype.createCategoryFilter = function() {
        if (this.categoriesListView == null) {
          this.categories();
        } else {
          this.categoriesListView.delegateEvents();
        }
        this.$el.append(this.categoriesListView.render().$el);
        return this.setDescription();
      };

      SpeakersPageView.prototype.setDescription = function() {
        var description;
        description = parseInt(this.model.get('category')) === 0 ? {
          'name': 'все отрасли'
        } : _.where(this.model.get('categoryList'), {
          id: parseInt(this.model.get('category'))
        })[0];
        return this.model.set('description', description);
      };

      SpeakersPageView.prototype.categories = function() {
        var categoryCollection;
        categoryCollection = new CategoryCollection(this.model.get('categoryList'));
        return this.categoriesListView = new CategoriesListView({
          category: this.model.get('category'),
          page: 'speakers',
          collection: categoryCollection
        });
      };

      SpeakersPageView.prototype.getSpeakersList = function() {
        return $.get("/api/post/get_categoryPeople/" + (this.model.get('category')) + "/1/10", (function(_this) {
          return function(data) {
            return _this.model.set('speakersList', data['peoples']);
          };
        })(this));
      };

      SpeakersPageView.prototype.createSpeakersList = function() {
        var data;
        data = this.model.get('speakersList');
        if (data.length > 0) {
          return this.speakersList();
        } else {
          return this.emptyList();
        }
      };

      SpeakersPageView.prototype.speakersList = function() {
        if (this.speakersCollectionView == null) {
          this.speakers();
        } else {
          this.speakersCollectionView.delegateEvents();
        }
        return this.$el.append(this.speakersCollectionView.render().$el);
      };

      SpeakersPageView.prototype.speakers = function() {
        var speakersCollection;
        speakersCollection = new SpeakersCollection(this.model.get('speakersList'));
        return this.speakersCollectionView = new SpeakersCollectionView({
          category: this.model.get('category'),
          description: this.model.get('description'),
          collection: speakersCollection
        });
      };

      SpeakersPageView.prototype.emptyList = function() {
        if (this.emptyView == null) {
          this.emptyView = new EmptyView({
            message: _.getContent(33)
          });
        } else {
          this.emptyView.delegateEvents();
        }
        return this.$el.append(this.emptyView.render().$el);
      };

      return SpeakersPageView;

    })(Backbone.View);
  });

}).call(this);
