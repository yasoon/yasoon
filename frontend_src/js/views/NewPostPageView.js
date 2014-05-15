(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/writePostFormTpl.htm', 'views/PostCategories', 'views/PostInterviews', 'collections/CategoryCollection', 'collections/InterviewCollection', 'editor', 'backbone', 'stickit', 'mediator', 'bootstrap'], function(writePostTpl, PostCategories, PostInterviews, CategoryCollection, InterviewCollection) {
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

      WritePostPage.prototype.initialize = function() {
        this.model.set('maxLength', 255);
        return this.handler();
      };

      WritePostPage.prototype.handler = function() {
        return this.listenTo(this.model, 'change:postDescription', this.symbolsCounter);
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
        this.stickit();
        this.ui();
        this.createCategoryList();
        this.createInterviewsList();
        return $('.collapse').collapse();
      };

      WritePostPage.prototype.createCategoryList = function() {
        return $.get('/api/category/get_CategoryList', (function(_this) {
          return function(data) {
            if (_this.postCategories == null) {
              _this.postCategories = new PostCategories({
                collection: new CategoryCollection(data)
              });
            }
            return _this.ui.categories.append(_this.postCategories.render().$el);
          };
        })(this), 'json');
      };

      WritePostPage.prototype.createInterviewsList = function() {
        return $.get('/api/interview/questions/1', (function(_this) {
          return function(data) {
            if (_this.postInterviews == null) {
              _this.postInterviews = new PostInterviews({
                collection: new InterviewCollection(data)
              });
            }
            _this.ui.interviews.append(_this.postInterviews.render().$el);
            return _this.$('.editor').redactor('sync');
          };
        })(this), 'json');
      };

      WritePostPage.prototype.showErrors = function(errors) {
        return _.each(errors, function(error) {
          return this.$el.find('#' + error.name).closest('.form-group').removeClass('has-success').addClass('has-error').find('.help-block').text(error.message);
        }, this);
      };

      WritePostPage.prototype.hideErrors = function() {
        return this.$('.form-group').removeClass('has-error').addClass('has-success').find('.help-block').text('');
      };

      WritePostPage.prototype.symbolsCounter = function(model, value) {
        var length;
        length = model.get('maxLength') - value.length;
        return this.ui.counter.text(length);
      };

      WritePostPage.prototype.changeCategoryHeading = function() {
        var names;
        names = this.postCategories.checkedCategoriesNames();
        return this.$('.categoryHeading').text(names);
      };

      WritePostPage.prototype.savePost = function(event) {
        var categories, fullText;
        event.preventDefault();
        fullText = this.postInterviews.createFullText();
        categories = this.postCategories.checkedCategories();
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

    })(Backbone.View);
  });

}).call(this);
