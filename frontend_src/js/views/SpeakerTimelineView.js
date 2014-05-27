(function() {
  define(['text!templates/speakerPageTpl.htm', 'views/SpeakerPostsCollectionView', 'views/SpeakerAnswersCollectionView', 'views/EmptyView', 'collections/SpeakerPostsCollection', 'collections/SpeakerAnswersCollection', 'backbone'], function(speakerPageTpl, SpeakerPostsCollectionView, SpeakerAnswersCollectionView, EmptyView, SpeakerPostsCollection, SpeakerAnswersCollection) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'lim',
      template: _.template(speakerPageTpl),
      initialize: function(options) {
        this.options = options || {};
        if (this.options.page === 'answers') {
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
        return $.post('/api/post/getQuestions', {
          'questionid[]': this.options.answers
        }, (function(_this) {
          return function(data) {
            var answered, emptyView;
            if (_this.speakerAnswersCollectionView == null) {
              _this.speakerAnswersCollectionView = new SpeakerAnswersCollectionView({
                collection: new SpeakerAnswersCollection(data)
              });
            } else {
              _this.speakerAnswersCollectionView.delegateEvents();
            }
            answered = _this.speakerAnswersCollectionView.answered();
            if (answered.length > 0) {
              return _this.$el.append(_this.speakerAnswersCollectionView.render().$el);
            } else {
              emptyView = new EmptyView({
                message: 'Нет ни одного вопроса!'
              });
              return _this.$el.append(emptyView.render().$el);
            }
          };
        })(this), 'json');
      },
      render: function() {
        this.$el.append(this.template(this.options));
        return this;
      }
    });
  });

}).call(this);
