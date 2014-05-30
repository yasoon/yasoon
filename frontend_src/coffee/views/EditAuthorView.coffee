define(
  [
    'text!templates/registerTpl.htm'
    'views/RegisterPageView'
    'fileupload'
    'backbone'
    'stickit'
    'mediator'
  ]
  (
    registerTpl
    RegisterPageView
  ) ->
    class Register extends RegisterPageView
      initialize: ->
        super
        @model.fetch()
        @model.set('update', yes)

      events: ->
        'click .js-update':     'updateAction'
        'click .nav':           'goToStep'
)