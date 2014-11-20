(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/SpeakerPostsCollectionView', 'views/SpeakerAnswersCollectionView', 'views/EmptyView', 'views/QuestionFormView', 'views/SpeakerWritePostButtonView', 'collections/SpeakerPostsCollection', 'collections/SpeakerAnswersCollection', 'models/QuestionModel', 'backbone'], function(SpeakerPostsCollectionView, SpeakerAnswersCollectionView, EmptyView, QuestionFormView, SpeakerWritePostButtonView, SpeakerPostsCollection, SpeakerAnswersCollection, QuestionModel) {
    var SpeakerContentView;
    return SpeakerContentView = (function(_super) {
      __extends(SpeakerContentView, _super);

      function SpeakerContentView() {
        return SpeakerContentView.__super__.constructor.apply(this, arguments);
      }

      SpeakerContentView.prototype.tagName = 'section';

      SpeakerContentView.prototype.className = 'lim';

      SpeakerContentView.prototype.initialize = function(options) {
        this.model.set({
          'id': options.id,
          'answers': options.author.answers,
          'posts': options.author.posts,
          'page': options.page
        });
        this.setHandlers();
        if (this.model.get('page') === 'answers') {
          return this.answersPage();
        } else {
          return this.postsPage();
        }
      };

      SpeakerContentView.prototype.answersPage = function() {
        if (!this.isAuthor()) {
          this.createQuestionForm();
        }
        if (this.model.get('answers').length) {
          return this.getAnswers();
        } else if (!this.model.get('posts').length && this.isAuthor()) {
          return this.emptyQuestions(48);
        } else {
          return this.emptyQuestions(50);
        }
      };

      SpeakerContentView.prototype.setHandlers = function() {
        this.listenTo(this.model, 'change:speakerPosts', this.createPosts);
        return this.listenTo(this.model, 'change:speakerAnswers', this.createAnswers);
      };

      SpeakerContentView.prototype.isAuthor = function() {
        return window.config.userId === parseInt(this.model.get('id'));
      };

      SpeakerContentView.prototype.postsPage = function() {
        if (this.isAuthor()) {
          this.writeButton();
        }
        if (this.model.get('posts').length) {
          return this.getPosts();
        } else {
          return this.emptyQuestions(34);
        }
      };

      SpeakerContentView.prototype.writeButton = function() {
        if (this.writePostButton == null) {
          this.writePostButton = new SpeakerWritePostButtonView();
        } else {
          this.writePostButton.delegateEvents();
        }
        return this.$el.append(this.writePostButton.render().$el);
      };

      SpeakerContentView.prototype.getPosts = function() {
        return $.post("/api/post/getPosts", {
          'postid[]': this.model.get('posts')
        }, (function(_this) {
          return function(data) {
            return _this.model.set('speakerPosts', data);
          };
        })(this));
      };

      SpeakerContentView.prototype.createPosts = function() {
        var postsCollection;
        postsCollection = new SpeakerPostsCollection(this.model.get('speakerPosts'));
        if (this.postsList == null) {
          this.postsList = new SpeakerPostsCollectionView({
            collection: postsCollection
          });
        } else {
          this.postsList.delegateEvents();
        }
        return this.$el.append(this.postsList.render().$el);
      };

      SpeakerContentView.prototype.getAnswers = function() {
        return $.post('/api/post/getQuestions', {
          'questionid[]': this.model.get('answers')
        }, (function(_this) {
          return function(data) {
            return _this.model.set('speakerAnswers', data);
          };
        })(this));
      };

      SpeakerContentView.prototype.createAnswers = function() {
        this.answersCollection = new SpeakerAnswersCollection(this.model.get('speakerAnswers'));
        if (this.speakerAnswers == null) {
          this.speakerAnswers = new SpeakerAnswersCollectionView({
            id: this.model.get('id'),
            collection: this.answersCollection
          });
        } else {
          this.speakerAnswers.delegateEvents();
        }
        return this.showList();
      };

      SpeakerContentView.prototype.showList = function() {
        if (this.isAuthor()) {
          return this.createAskedList();
        } else {
          return this.createAnsweredList();
        }
      };

      SpeakerContentView.prototype.createAnsweredList = function() {
        if (this.speakerAnswers.answered().length) {
          return this.answeredQuestions();
        } else {
          return this.emptyQuestions(47);
        }
      };

      SpeakerContentView.prototype.createAskedList = function() {
        if (this.speakerAnswers.answered().length) {
          this.answeredQuestions();
        }
        if (this.speakerAnswers.asked().length) {
          return this.askedQuestions();
        }
      };

      SpeakerContentView.prototype.askedQuestions = function() {
        return this.$el.prepend(this.speakerAnswers.renderQuestion().$el);
      };

      SpeakerContentView.prototype.answeredQuestions = function() {
        return this.$el.append(this.speakerAnswers.renderAnswer().$el);
      };

      SpeakerContentView.prototype.emptyQuestions = function(contentId) {
        this.emptyView = new EmptyView({
          message: _.getContent(contentId)
        });
        return this.$el.append(this.emptyView.render().$el);
      };

      SpeakerContentView.prototype.createQuestionForm = function() {
        var questionModel;
        questionModel = new QuestionModel({
          'author_id': this.model.get('id')
        });
        if (this.questionForm == null) {
          this.questionForm = new QuestionFormView({
            model: questionModel
          });
        } else {
          this.questionForm.delegateEvents();
        }
        return this.$el.append(this.questionForm.render().$el);
      };

      return SpeakerContentView;

    })(Backbone.View);
  });

}).call(this);
