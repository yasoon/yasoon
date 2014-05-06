define(
  [
    'text!templates/writePostFormTpl.htm'
    'backbone'
    'stickit'
    'mediator'
  ]
(
  registerTpl
) ->
  Backbone.View.extend({
    events: ->
      'click #register': 'registerAction'
      'click #update': 'updateAction'
      'click .nav': 'goToStep'

    bindings:
      '#postDescription': 'postDescription'
      '#postTile': 'postTile'

    className: 'page-layout m-page'

    tagName: 'section'

    template: _.template(registerTpl)

    initialize: ->
      @handler()
      @model.set('maxLength', 290)

    handler: ->
      @listenTo(@model, 'change:postDescription', @symbolsCounter)

    ui: ->
      @.ui =
        counter: @$('.counter')

    render: ->
      @$el.empty().append(@template(@model.toJSON()))
      @onRender()
      @

    onRender: ->
      

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
      @ui.counter.text(length)

  })
)