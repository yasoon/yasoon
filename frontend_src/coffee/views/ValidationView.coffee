define(
  [
    'backbone'
  ]
  (
  ) ->
    Backbone.View.extend({
      ui: ->
        @.ui =
          counter: @$('.counter')

      showErrors: (errors) ->
        _.each(errors, (error) ->
          @$el
          .find('#' + error.name)
          .closest('.form-group')
          .removeClass('has-success')
          .addClass('has-error')
          .find('.help-block')
          .text(error.message)
        , @)

      hideErrors: ->
        @$('.form-group')
        .removeClass('has-error')
        .addClass('has-success')
        .find('.help-block')
        .text('')

      symbolsCounter: (model, value) ->
        length = model.get('maxLength') - value.length
        if @ui.counter?
          @ui.counter.text(length)
    })
)