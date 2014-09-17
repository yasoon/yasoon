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
          'click :submit': 'savePost',
          'click .js-cancel': 'cancelPost'
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
        this.createCategoryList();
        return this.$('input:text:visible:first').focus();
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
        event.preventDefault();
        this.hideErrors();
        this.model.set({
<<<<<<< HEAD
          'text': this.createAnswerArray(),
=======
          'text': this.createAnswersArray(),
>>>>>>> master
          'category': this.postCategories.checkedCategories(),
          'description': this.getDescription()
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
            if ($(item).find('.redactor_editor').text().length) {
              return fullTextContainer.append(_this.getText(iterator, item));
            }
          };
        })(this));
        return fullTextContainer.html();
      };

      WritePostPage.prototype.createAnswersArray = function() {
        var answers;
        answers = [];
        $('#questionsList > .ui-sortable > li').each((function(_this) {
          return function(iterator, item) {
            if ($(item).find('.redactor_editor').text().length) {
              return answers.push(_this.getObj(iterator, item));
            }
          };
        })(this));
        return answers;
      };

      WritePostPage.prototype.getText = function(iterator, item) {
        return this.interviewsTemplate({
          'id': iterator,
          'text': $(item).find('.redactor_editor').html(),
          'question': $(item).find('.a-quertion').html()
        });
      };

      WritePostPage.prototype.getObj = function(iterator, item) {
        return {
          'id': iterator,
          'text': $(item).find('.redactor_editor').html()
        };
      };

      WritePostPage.prototype.getDescription = function() {
        if (this.model.get('description') != null) {
          return this.model.get('description');
        } else {
          return '';
        }
      };

      WritePostPage.prototype.sendPostData = function() {
        return $.post('/api/post/saveInterview', {
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
            return _this.showError(error);
          };
        })(this));
      };

      WritePostPage.prototype.showError = function(error) {
        this.$el.find('#' + error.name).closest('.di').removeClass('has-success').addClass('has-error');
        return this.checkPosition();
      };

      WritePostPage.prototype.checkPosition = function() {
        var topPosition;
        topPosition = this.$el.find('.has-error').offset().top;
        if (topPosition < $(window).scrollTop()) {
          return $("html, body").animate({
            scrollTop: topPosition - 20
          }, '500', 'swing');
        }
      };

      WritePostPage.prototype.hideErrors = function() {
        return this.$('.di').removeClass('has-error').addClass('has-success');
      };

      WritePostPage.prototype.confirmAction = function() {
        return window.confirm(_.getContent(42));
      };

      WritePostPage.prototype.cancelPost = function(event) {
        event.preventDefault();
        if (this.confirmAction()) {
          return window.location = "/#/speaker/" + Window.config.userId + "/posts/";
        }
      };

      return WritePostPage;

    })(ValidationView);
  });

}).call(this);
