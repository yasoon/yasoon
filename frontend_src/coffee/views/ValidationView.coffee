define(['backbone'], () ->
  class ValidationView extends Backbone.View
    showErrors: (errors) ->
      _.each(errors, (error) => @showError(error))

    showError: (error) ->
      @$('#' + error.name).closest('.form-group').removeClass('has-success').addClass('has-error').find('.help-block').text(error.message)

    hideErrors: ->
      @$('.form-group').removeClass('has-error').addClass('has-success').find('.help-block').text('')

    symbolsCounter: (model, value) ->
      length = if value then model.get('maxLength') - value.length else model.get('maxLength')
      if @$('.counter')? then @$('.counter').text(length)
)