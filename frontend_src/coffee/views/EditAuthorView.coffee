define(
  [
    'text!templates/editProfileTpl.htm'
    'views/RegisterPageView'
    'fileupload'
    'backbone'
    'stickit'
    'mediator'
  ]
  (
    editProfileTpl
    RegisterPageView
  ) ->
    class UpdateProfile extends RegisterPageView
      template:                 _.template(editProfileTpl)

      initialize: ->
        _.bindAll(@, 'render');
        @handler()
        @model.on('change', @render)
#        @listenTo(@model, 'change', @render)
        $.get('/api/author/getShortUserData', (data) => @model.set(_.extend({}, data, {'maxLength': 290})))

      render: ->
        console.log(@, @$el)
        @$el.empty().append(@template(@model.toJSON()))
        @onRender()
        @

      onRender: ->
        @setImageUploader()
        @stickit()
        @ui()

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