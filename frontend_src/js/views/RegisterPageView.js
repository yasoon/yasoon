(function() {
  define(['text!templates/registerTpl.htm', 'models/UserUpdateModel', 'fileupload', 'backbone', 'stickit', 'mediator'], function(registerTpl, UserUpdateModel) {

    /* TODO:separate separate this big view to smaller views */
    return Backbone.View.extend({
      events: function() {
        return {
          'click #register': 'registerAction',
          'click #update': 'updateAction',
          'click .nav': 'goToStep'
        };
      },
      bindings: {
        '#description': 'description',
        '#subscribed': 'subscribed',
        '#password': 'password',
        '#username': 'username',
        '#interest': 'interest',
        '#homepage': 'homepage',
        '#email': 'email',
        '#dream': 'dream',
        '#img': 'img',
        '#job': 'job'
      },
      className: 'page-layout m-page',
      tagName: 'section',
      template: _.template(registerTpl),
      initialize: function() {
        this.handler();
        return this.model.set('maxLength', 290);
      },
      handler: function() {
        return this.listenTo(this.model, 'change:description', this.symbolsCounter);
      },
      ui: function() {
        return this.ui = {
          counter: this.$('.counter')
        };
      },
      setModels: function() {
        this.model = new UserUpdateModel(this.model.toJSON());
        this.stickit();
        return this.handler();
      },
      render: function() {
        this.$el.empty().append(this.template(this.model.toJSON()));
        this.onRender();
        return this;
      },
      onRender: function() {
        var count, steps;
        steps = this.$el.find('fieldset');
        count = steps.size();
        this.ui();
        new AjaxUpload(this.$('#upload')[0], {
          action: '/api/author/upload_user_image',
          name: 'files[]',
          id: 'upload',
          createInput: function() {},
          onComplete: function(file, data) {
            var image, name;
            name = file.substr(0, file.indexOf('.'));
            image = data.dir + data.file_name;
            if (data.dir != null) {
              return this.model.set('img', image);
            }
          }
        });
        steps.each(function(step) {
          return steps.eq(step).wrap('<div id="step' + step + '"></div>');
        });
        this.showStep(0);
        return this.stickit();
      },
      goToStep: function(event) {
        var $this, step;
        $this = $(event.currentTarget);
        step = $this.data('count');
        if ($this.hasClass('next')) {
          return this.showStep(step + 1);
        } else {
          return this.showStep(step - 1);
        }
      },
      showStep: function(step) {
        return this.$el.find("#step" + step).show().siblings().hide();
      },
      registerAction: function(event) {
        event.preventDefault();
        this.hideErrors();
        if (this.model.isValid()) {
          return $.post('/api/author/register', this.model.toJSON(), (function(_this) {
            return function(data) {
              if (data.error === false) {
                _this.showStep(1);
                return _this.setModels();
              } else {
                if (data.errorType === 'emailExist') {
                  return _this.showErrors([
                    {
                      name: 'email',
                      message: 'Пользователь с таким email уже есть'
                    }
                  ]);
                }
              }
            };
          })(this), 'json');
        } else {
          return this.showErrors(this.model.validationError);
        }
      },
      updateAction: function(event) {
        event.preventDefault();
        this.hideErrors();
        if (this.model.isValid()) {
          return $.post('/api/author/editinfo', this.model.toJSON(), function(data) {
            console.log(data);
            if (data.authorData === true) {
              return window.location = '/#author/';
            }
          }, 'json');
        } else {
          this.showErrors(this.model.validationError);
          return this.showStep(1);
        }
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
      }
    });
  });

}).call(this);
