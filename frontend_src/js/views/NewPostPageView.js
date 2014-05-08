(function() {
  define(['text!templates/writePostFormTpl.htm', 'views/PostCategories', 'views/PostInterviews', 'collections/CategoryCollection', 'collections/InterviewCollection', 'editor', 'backbone', 'stickit', 'mediator'], function(registerTpl, PostCategories, PostInterviews, CategoryCollection, InterviewCollection) {
    return Backbone.View.extend({
      events: function() {
        return {
          'change .select input[type="checkbox"]': 'setCategories',
          'click .questionContent': 'editor'
        };
      },
      bindings: {
        '#postDescription': 'postDescription',
        '#postTile': 'postTile'
      },
      className: 'page-layout m-page',
      tagName: 'section',
      template: _.template(registerTpl),
      initialize: function() {
        this.model.set('maxLength', 255);
        return this.handler();
      },
      handler: function() {
        return this.listenTo(this.model, 'change:postDescription', this.symbolsCounter);
      },
      ui: function() {
        return this.ui = {
          counter: this.$('.counter'),
          categories: this.$('.select'),
          interviews: this.$('.questions_list')
        };
      },
      render: function() {
        this.$el.empty().append(this.template(this.model.toJSON()));
        this.onRender();
        return this;
      },
      onRender: function() {
        this.stickit();
        this.ui();
        this.createCategoryList();
        return this.createInterviewsList();
      },
      createCategoryList: function() {
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
      },
      createInterviewsList: function() {
        return $.get('/api/interview/questions/1', (function(_this) {
          return function(data) {
            if (_this.postInterviews == null) {
              _this.postInterviews = new PostInterviews({
                collection: new InterviewCollection(data)
              });
            }
            _this.ui.interviews.append(_this.postInterviews.render().$el);
            return _this.$('.editor').redactor();
          };
        })(this), 'json');
      },
      showErrors: function(errors) {
        return _.each(errors, function(error) {
          return this.$el.find('#' + error.name).closest('.form-group').removeClass('has-success').addClass('has-error').find('.help-block').text(error.message);
        }, this);
      },
      hideErrors: function() {
        return this.$('.form-group').removeClass('has-error').addClass('has-success').find('.help-block').text('');
      },
      symbolsCounter: function(model, value) {
        var length;
        length = model.get('maxLength') - value.length;
        return this.ui.counter.text(length);
      },
      editor: function(event) {
        event.stopPropagation();
        event.preventDefault();
        return console.log(event);
      },
      setCategories: function(event) {
        var blocked, categories;
        categories = this.$('input:checkbox:checked').map(function(iterator, elem) {
          return $(this).val();
        }).get();
        this.model.set('categories', categories);
        blocked = categories.length > 2 ? true : false;
        return this.$('input:checkbox:not(:checked)').prop('disabled', blocked);
      }
    });
  });

}).call(this);
