(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/writePostFormTpl.htm', 'views/PostCategories', 'views/PostInterviews', 'views/ValidationView', 'collections/CategoryCollection', 'collections/InterviewCollection', 'editor', 'backbone', 'stickit', 'mediator', 'bootstrap', 'jqueryUi'], function(writePostTpl, PostCategories, PostInterviews, ValidationView, CategoryCollection, InterviewCollection) {
    var WritePostPage;
    return WritePostPage = (function(_super) {
      __extends(WritePostPage, _super);

      function WritePostPage() {
        return WritePostPage.__super__.constructor.apply(this, arguments);
      }

      WritePostPage.prototype.events = function() {
        return {
          'click button:submit': 'savePost'
        };
      };

      WritePostPage.prototype.bindings = {
        '#description': 'description',
        '#title': 'title'
      };

      WritePostPage.prototype.className = 'page-layout m-page';

      WritePostPage.prototype.tagName = 'section';

      WritePostPage.prototype.template = _.template(writePostTpl);

      WritePostPage.prototype.initialize = function(options) {
        this.pageId = options.id || 1;
        this.model.set('maxLength', 255);
        return this.handler();
      };

      WritePostPage.prototype.handler = function() {
        return this.listenTo(this.model, 'change:description', this.symbolsCounter);
      };

      WritePostPage.prototype.ui = function() {
        return this.ui = {
          counter: this.$('.counter'),
          categories: this.$('#categoryList'),
          interviews: this.$('#questionsList')
        };
      };

      WritePostPage.prototype.render = function() {
        this.$el.empty().append(this.template(this.model.toJSON()));
        this.onRender();
        return this;
      };

      WritePostPage.prototype.onRender = function() {
        this.ui();
        this.createCategoryList();
        this.createInterviewsList();
        this.stickit();
        return $('.collapse').collapse();
      };

      WritePostPage.prototype.createCategoryList = function() {
        if (this.postCategories == null) {
          this.postCategories = new PostCategories({
            collection: new CategoryCollection(Window.config.category)
          });
        }
        return this.ui.categories.append(this.postCategories.render().$el);
      };

      WritePostPage.prototype.createInterviewsList = function() {
        return $.get("/api/interview/questions/" + this.pageId, (function(_this) {
          return function(data) {
            if (_this.postInterviews == null) {
              _this.postInterviews = new PostInterviews({
                collection: new InterviewCollection(data)
              });
            }
            _this.ui.interviews.append(_this.postInterviews.render().$el);
            _this.$('.editor').redactor('sync');
            return _this.$('.sortable ul').sortable({
              cancel: '.form-group'
            });
          };
        })(this), 'json');
      };

      WritePostPage.prototype.savePost = function(event) {
        var categories, fullText;
        event.preventDefault();
        categories = this.postCategories.checkedCategories();
        fullText = this.postInterviews.createFullText();
        if (fullText) {
          this.model.set({
            'text': fullText,
            'category': categories
          });
          return $.post('/api/post/savePost', {
            postData: this.model.toJSON()
          }, function(data) {
            return Backbone.Mediator.publish('post:submitted', data.postId);
          });
        }
      };

      return WritePostPage;

    })(ValidationView);
  });

}).call(this);
