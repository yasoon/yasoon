// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/editable', 'jqueryui', 'jquery.ui.widget', 'jqueryupload', 'jqueryuploadiframetransport'], function(EditableView) {
  'use strict';
  var RegisterRegisterView,
    _this = this;
  return RegisterRegisterView = (function(_super) {

    __extends(RegisterRegisterView, _super);

    function RegisterRegisterView() {
      var _this = this;
      this.continueRegistration = function() {
        return RegisterRegisterView.prototype.continueRegistration.apply(_this, arguments);
      };
      this.updateCallback = function() {
        return RegisterRegisterView.prototype.updateCallback.apply(_this, arguments);
      };
      this.addCallback = function() {
        return RegisterRegisterView.prototype.addCallback.apply(_this, arguments);
      };
      return RegisterRegisterView.__super__.constructor.apply(this, arguments);
    }

    RegisterRegisterView.prototype.className = 'register';

    RegisterRegisterView.prototype.templateName = 'register';

    RegisterRegisterView.prototype.modes = ['active', 'active_step2'];

    RegisterRegisterView.prototype.addCallback = function() {
      return this.setMode('active_step2');
    };

    RegisterRegisterView.prototype.updateCallback = function() {};

    RegisterRegisterView.prototype.continueRegistration = function() {
      this.setMode('active_step2');
      return $('#fileupload').fileupload({
        dataType: 'json',
        autoUpload: true,
        number: 1,
        done: function(e, data) {
          return $.each(data.result, function(index, file) {
            var fileName;
            fileName = file.dir + file.file_name;
            return $(".files_success_upload").append('<img src="' + fileName + '" width="53" height="53"/>');
          });
        }
      });
    };

    return RegisterRegisterView;

  })(EditableView);
});
