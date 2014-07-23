(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/writePostFormTpl.htm', 'text!templates/postInterviewTpl.htm', 'views/PostCategories', 'views/PostInterviews', 'views/ValidationView', 'collections/CategoryCollection', 'collections/InterviewCollection', 'editor', 'backbone', 'stickit', 'mediator', 'bootstrap', 'jqueryUi'], function(writePostTpl, postInterviewTpl, PostCategories, PostInterviews, ValidationView, CategoryCollection, InterviewCollection) {
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

      WritePostPage.prototype.interviewsTemplate = _.template(postInterviewTpl);

      WritePostPage.prototype.initialize = function(options) {
        this.getDefaultInterview(options.id);
        this.model.set({
          'maxLength': 255
        });
        return this.handler();
      };

      WritePostPage.prototype.getDefaultInterview = function(id) {
        return $.get("/api/interview/get_interviews", (function(_this) {
          return function(data) {
            var array;
            array = _.where(data, {
              id: parseInt(id)
            });
            return _this.model.set('interviewId', array.length ? id : data[0]['id']);
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
        this.$el.empty().append(this.template(this.model.toJSON()));
        this.onRender();
        return this;
      };

      WritePostPage.prototype.onRender = function() {
        return this.createCategoryList();
      };

      WritePostPage.prototype.createCategoryList = function() {
        var category;
        this.model.set('categoriesList', Window.config.category);
        category = new CategoryCollection(this.model.get('categoriesList'));
        if (this.postCategories == null) {
          this.postCategories = new PostCategories({
            collection: category
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
        var interviews;
        interviews = new InterviewCollection(this.model.get('interviewQuestions'));
        if (this.postInterviews == null) {
          this.postInterviews = new PostInterviews({
            collection: interviews
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
        var description;
        event.preventDefault();
        this.hideErrors();
        description = this.getDescription();
        this.model.set({
          'text': this.createFullText(),
          'category': this.postCategories.checkedCategories(),
          'description': description
        });
        if (this.model.isValid()) {
          return this.sendPostData();
        } else {
          return this.showErrors(this.model.validationError);
        }
      };

      WritePostPage.prototype.createFullText = function() {
        var fullTextContainer;
        fullTextContainer = $('<div></div>');
        $('#questionsList > .ui-sortable > li').each((function(_this) {
          return function(iterator, item) {
            return fullTextContainer.append(_this.getText(iterator, item));
          };
        })(this));
        return fullTextContainer.html();
      };

      WritePostPage.prototype.getText = function(iterator, item) {
        var text;
        text = $(item).find('.redactor_editor').text().length ? $(item).find('.redactor_editor').html() : 'Пользователь не ответил на этот вопрос';
        return this.interviewsTemplate({
          'id': iterator,
          'text': text,
          'question': $(item).find('.a-quertion').html()
        });
      };

      WritePostPage.prototype.getDescription = function() {
        if (this.model.get('description') != null) {
          return this.model.get('description');
        } else {
          return '';
        }
      };

      WritePostPage.prototype.sendPostData = function() {
        return $.post('/api/post/savePost', {
          postData: this.model.toJSON()
        }, (function(_this) {
          return function(data) {
            return _this.changeLocation(data);
          };
        })(this));
      };

      WritePostPage.prototype.changeLocation = function(data) {
        window.location = "#/post/" + data.postId + "/";
        return window.location.reload(true);
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
