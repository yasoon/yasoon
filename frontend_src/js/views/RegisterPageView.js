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
        this.listenTo(this.model, 'change:img', this.changeImage);
        return this.listenTo(this.model, 'change:interviewCaption', this.symbolsCounter);
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
        this.createSteps();
        return this;
      };

      Register.prototype.onRender = function() {
        this.ui();
        this.setImageUploader(this.model);
        this.showStep(0);
        return this.stickit();
      };

      Register.prototype.createSteps = function() {
        var steps;
        steps = this.$el.find('fieldset');
        steps.each(function(step) {
          return steps.eq(step).wrap('<div id="step' + step + '"></div>');
        });
        return this.onRender();
      };

      Register.prototype.setImageUploader = function(model) {
        return new AjaxUpload(this.$('#uploadImage')[0], {
          action: '/api/author/upload_user_image',
          name: 'files[]',
          id: 'upload',
          createInput: function() {},
          onComplete: function(file, data) {
            var ret;
            ret = JSON.parse($(data).text());
            if (ret.file_name != null) {
              return model.set('img', ret.file_name);
            }
          }
        });
      };

      Register.prototype.changeImage = function() {
        var path;
        path = "/upload/avatar/" + (this.model.get('img'));
        return $('.file_upload_block, header').find('img').attr('src', path);
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
        this.$(event.currentTarget).prop('disabled', true);
        if (this.model.isValid()) {
          return $.post('/api/author/register', this.model.toJSON(), (function(_this) {
            return function(data) {
              if (data.error === false) {
                return _this.registered();
              } else {
                return _this.existedEmail(data);
              }
            };
          })(this));
        } else {
          this.$(event.currentTarget).prop('disabled', false);
          return this.showErrors(this.model.validationError);
        }
      };

      Register.prototype.registered = function() {
        this.showStep(1);
        return this.setModels();
      };

      Register.prototype.existedEmail = function(data) {
        if (data.errorType === 'emailExist') {
          this.$(event.currentTarget).prop('disabled', false);
          return this.showErrors([
            {
              name: 'email',
              message: 'Пользователь с таким email уже есть'
            }
          ]);
        }
      };

      Register.prototype.updateAction = function(event) {
        event.preventDefault();
        this.hideErrors();
        this.$(event.currentTarget).prop('disabled', true);
        if (this.model.isValid()) {
          return $.post('/api/author/editinfo', this.model.toJSON(), (function(_this) {
            return function(data) {
              if (data.authorData === true) {
                return _this.loadUser();
              }
            };
          })(this));
        } else {
          this.showErrors(this.model.validationError);
          this.showStep(1);
          return this.$(event.currentTarget).prop('disabled', false);
        }
      };

      Register.prototype.loadUser = function() {
        window.location = "/#/speaker/" + (this.model.get('id')) + "/posts/";
        return window.location.reload(true);
      };

      return Register;

    })(ValidationView);
  });

}).call(this);
