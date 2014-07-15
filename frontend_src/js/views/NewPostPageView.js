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
          'click :submit': 'savePost'
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
        this.getDefaultInterview(options.id);
        return this.handler();
      };

      WritePostPage.prototype.getDefaultInterview = function(id) {
        return $.get("/api/interview/get_interviews", (function(_this) {
          return function(data) {
            var array, interview;
            array = _.where(data, {
              id: parseInt(id)
            });
            interview = array.length > 0 ? id : data[0]['id'];
            return _this.model.set('interviewId', interview);
          };
        })(this));
      };

      WritePostPage.prototype.handler = function() {
        this.listenTo(this.model, 'change:description', this.symbolsCounter);
        this.listenTo(this.model, 'change:categoriesList', this.createInterviewsList);
        this.listenTo(this.model, 'change:interviewQuestions', this.render);
        return this.listenTo(this.model, 'change:interviewId', this.getInterviewQuestions);
      };

      WritePostPage.prototype.render = function() {
        this.$el.empty().append(this.template({
          'maxLength': 255
        }));
        this.onRender();
        return this;
      };

      WritePostPage.prototype.onRender = function() {
        return this.createCategoryList();
      };

      WritePostPage.prototype.createCategoryList = function() {
        this.model.set('categoriesList', Window.config.category);
        if (this.postCategories == null) {
          this.postCategories = new PostCategories({
            collection: new CategoryCollection(this.model.get('categoriesList'))
          });
        }
        return this.$('#categories').append(this.postCategories.render().$el);
      };

      WritePostPage.prototype.getInterviewQuestions = function() {
        return $.get("/api/interview/questions/" + (this.model.get('interviewId')), (function(_this) {
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
        this.$('#questionsList').append(this.postInterviews.render().$el);
        return this.afterRender();
      };

      WritePostPage.prototype.afterRender = function() {
        this.$('.editor').redactor({
          imageUpload: '/api/post/upload_image'
        });
        this.$('.sortable ul').sortable({
          cancel: '.form-group'
        });
        return this.stickit();
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

      WritePostPage.prototype.showErrors = function(errors) {
        return _.each(errors, (function(_this) {
          return function(error) {
            return _this.$el.find('#' + error.name).closest('.di').removeClass('has-success').addClass('has-error');
          };
        })(this));
      };

      WritePostPage.prototype.hideErrors = function() {
        return this.$('.di').removeClass('has-error').addClass('has-success');
      };

      return WritePostPage;

    })(ValidationView);
  });

}).call(this);
