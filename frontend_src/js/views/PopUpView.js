(function() {
  define(['backbone'], function() {
    return Backbone.View.extend({
      events: function() {
        return {
          'click .popUpBackground': 'clickPopUp'
        };
      },
      clickPopUp: function(event) {
        event.preventDefault();
        return this.closePopUp();
      },
      escapePopUp: function(event) {
        event.preventDefault();
        if (event.keyCode === 27 || event.which === 27) {
          this.closePopUp();
          return $(document).off('keyup');
        }
      },
      closePopUp: function() {
        return this.remove();
      },
      render: function() {
        this.$el.prepend('<div class="popUpBackground"></div>');
        return this;
      },
      initialize: function() {
        _.bindAll(this);
        return $(document).on('keyup', this.escapePopUp);
      }
    });
  });

}).call(this);
