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
        $.get('/api/author/getShortUserData', (data) => @model.set(_.extend({}, data, {'maxLength': 290})))

      render: ->
        @$el.empty().append(@template(@model.toJSON()))
        @onRender()
        @

      handler: ->
        super
        @listenTo(@model, 'change:id', @render)

      onRender: ->
        @stickit()
        @ui()
        @setImageUploader(@model)

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


      updateAction: (event) ->
        event.preventDefault()
        @hideErrors()
        @$(event.currentTarget).prop('disabled', yes)

        if @model.isValid()
          $.post('/api/author/editinfo', @model.toJSON(), (data) => if data.authorData is yes then @loadUser())
        else
          @showErrors(@model.validationError)
          @$(event.currentTarget).prop('disabled', no)

      loadUser: ->
        window.location = "/#/speaker/#{@model.get('id')}/posts/"
        window.location.reload(yes)

)