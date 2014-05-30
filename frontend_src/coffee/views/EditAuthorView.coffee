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

      bindings:
        '#interviewCaption':    'interviewCaption'
        '#old_pasword':         'old_pasword'
        '#new_pasword':         'new_pasword'
        '#subscribed':          'subscribed'
        '#interest':            'interest'
        '#homepage':            'homepage'
        '#email':               'email'
        '#dream':               'dream'
        '#name':                'name'
        '#img':                 'img'
        '#job':                 'job'
)