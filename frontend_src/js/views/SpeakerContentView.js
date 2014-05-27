(function() {
  define(['views/SpeakerPostsCollectionView', 'views/SpeakerAnswersCollectionView', 'views/EmptyView', 'views/QuestionFormView', 'collections/SpeakerPostsCollection', 'collections/SpeakerAnswersCollection', 'models/QuestionModel', 'backbone'], function(SpeakerPostsCollectionView, SpeakerAnswersCollectionView, EmptyView, QuestionFormView, SpeakerPostsCollection, SpeakerAnswersCollection, QuestionModel) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'lim',
      initialize: function(options) {
        this.options = options || {};
        if (this.options.page === 'answers') {
          if (this.options.id !== Window.config.userId) {
            this.createQuestionForm();
          }
          return this.createSpeakerAnswers();
        } else {
          return this.createSpeakerPosts();
        }
      },
      createSpeakerPosts: function() {
        return $.post("/api/post/getPost", {
          'postid[]': this.options.posts
        }, (function(_this) {
          return function(data) {
            if (_this.speakerPostsCollectionView == null) {
              _this.speakerPostsCollectionView = new SpeakerPostsCollectionView({
                collection: new SpeakerPostsCollection(data)
              });
            } else {
              _this.speakerPostsCollectionView.delegateEvents();
            }
            return _this.$el.append(_this.speakerPostsCollectionView.render().$el);
          };
        })(this), 'json');
      },
      createSpeakerAnswers: function() {
        if (this.options.answers.length > 0) {
          return $.post('/api/post/getQuestions', {
            'questionid[]': this.options.answers
          }, (function(_this) {
            return function(data) {
              var answered;
              if (_this.speakerAnswersCollectionView == null) {
                _this.speakerAnswersCollectionView = new SpeakerAnswersCollectionView({
                  id: _this.options.id,
                  collection: new SpeakerAnswersCollection(data)
                });
              } else {
                _this.speakerAnswersCollectionView.delegateEvents();
              }
              answered = _this.speakerAnswersCollectionView.answered();
              if (answered.length > 0) {
                return _this.$el.append(_this.speakerAnswersCollectionView.render().$el);
              } else if (_this.options.id === Window.config.userId) {
                return _this.$el.append(_this.speakerAnswersCollectionView.render().$el);
              } else {
                _this.emptyView = new EmptyView({
                  message: 'Нет ни одного вопроса!'
                });
                return _this.$el.append(_this.emptyView.render().$el);
              }
            };
          })(this), 'json');
        } else {
          this.emptyView = new EmptyView({
            message: 'Нет ни одного вопроса!'
          });
          return this.$el.append(this.emptyView.render().$el);
        }
      },
      createQuestionForm: function() {
        if (this.questionFormView == null) {
          this.questionFormView = new QuestionFormView({
            model: new QuestionModel({
              'author_id': this.options.id
            })
          });
        } else {
          this.questionFormView.delegateEvents();
        }
        return this.$el.append(this.questionFormView.render().$el);
      }
    });
  });

}).call(this);
