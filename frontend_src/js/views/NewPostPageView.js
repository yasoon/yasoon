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
        this.getInterviewQuestions();
        return this.handler();
      };

      WritePostPage.prototype.handler = function() {
        this.listenTo(this.model, 'change:description', this.symbolsCounter);
        return this.listenTo(this.model, 'change:interviewQuestions', this.render);
      };

      WritePostPage.prototype.ui = function() {
        return this.ui = {
          counter: this.$('.counter'),
          categories: this.$('#categoryList'),
          interviews: this.$('#questionsList'),
          collapse: this.$('.collapse')
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
        return this.createInterviewsList();
      };

      WritePostPage.prototype.createCategoryList = function() {
        if (this.postCategories == null) {
          this.postCategories = new PostCategories({
            collection: new CategoryCollection(Window.config.category)
          });
        }
        return this.ui.categories.append(this.postCategories.render().$el);
      };

      WritePostPage.prototype.getInterviewQuestions = function() {
        return $.get("/api/interview/questions/" + this.pageId, (function(_this) {
          return function(data) {
            return _this.model.set('interviewQuestions', data);
          };
        })(this));
      };

      WritePostPage.prototype.createInterviewsList = function() {
        if (this.postInterviews == null) {
          this.postInterviews = new PostInterviews({
            collection: new InterviewCollection(this.model.get('interviewQuestions'))
          });
        }
        this.ui.interviews.append(this.postInterviews.render().$el);
        return this.afterRender();
      };

      WritePostPage.prototype.afterRender = function() {
        this.$('.editor').redactor({
          imageUpload: '/api/post/upload_image'
        });
        this.$('.sortable ul').sortable({
          cancel: '.form-group'
        });
        this.stickit();
        return this.ui.collapse.collapse('hide');
      };

      WritePostPage.prototype.savePost = function(event) {
        event.preventDefault();
        this.hideErrors();
        this.model.set({
          'text': this.postInterviews.createFullText(),
          'category': this.postCategories.checkedCategories()
        });
        if (!this.model.isValid()) {
          return this.showErrors(this.model.validationError);
        } else {
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
