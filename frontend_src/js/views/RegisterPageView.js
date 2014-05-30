(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/registerTpl.htm', 'models/UserUpdateModel', 'views/ValidationView', 'fileupload', 'backbone', 'stickit', 'mediator'], function(registerTpl, UserUpdateModel, ValidationView) {
    var Register;
    return Register = (function(_super) {
      __extends(Register, _super);

      function Register() {
        return Register.__super__.constructor.apply(this, arguments);
      }

      Register.prototype.events = function() {
        return {
          'click .js-register': 'registerAction',
          'click .js-update': 'updateAction',
          'click .nav': 'goToStep'
        };
      };

      Register.prototype.bindings = {
        '#interviewCaption': 'interviewCaption',
        '#subscribed': 'subscribed',
        '#password': 'password',
        '#interest': 'interest',
        '#homepage': 'homepage',
        '#email': 'email',
        '#dream': 'dream',
        '#name': 'name',
        '#img': 'img',
        '#job': 'job'
      };

      Register.prototype.className = 'page-layout m-page';

      Register.prototype.tagName = 'section';

      Register.prototype.template = _.template(registerTpl);

      Register.prototype.initialize = function() {
        this.handler();
        return this.model.set('maxLength', 290);
      };

      Register.prototype.handler = function() {
        return this.listenTo(this.model, 'change:description', this.symbolsCounter);
      };

      Register.prototype.ui = function() {
        return this.ui = {
          counter: this.$('.counter')
        };
      };

      Register.prototype.setModels = function() {
        this.model = new UserUpdateModel(this.model.toJSON());
        this.stickit();
        return this.handler();
      };

      Register.prototype.render = function() {
        this.$el.empty().append(this.template(this.model.toJSON()));
        this.onRender();
        return this;
      };

      Register.prototype.onRender = function() {
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
      };

      Register.prototype.goToStep = function(event) {
        var $this, step;
        $this = $(event.currentTarget);
        step = $this.data('count');
        if ($this.hasClass('next')) {
          return this.showStep(step + 1);
        } else {
          return this.showStep(step - 1);
        }
      };

      Register.prototype.showStep = function(step) {
        return this.$el.find("#step" + step).show().siblings().hide();
      };

      Register.prototype.registerAction = function(event) {
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
      };

      Register.prototype.updateAction = function(event) {
        event.preventDefault();
        this.hideErrors();
        if (this.model.isValid()) {
          return $.post('/api/author/editinfo', this.model.toJSON(), function(data) {
            console.log(data);
            if (data.authorData === true) {
              return window.location = '/#author/posts/';
            }
          }, 'json');
        } else {
          this.showErrors(this.model.validationError);
          return this.showStep(1);
        }
      };

      return Register;

    })(ValidationView);
  });

}).call(this);
