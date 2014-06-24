define(
  [
    'text!templates/registerTpl.htm'
    'models/UserUpdateModel'
    'views/ValidationView'
    'fileupload'
    'backbone'
    'stickit'
    'mediator'
  ]
  (
    registerTpl
    UserUpdateModel
    ValidationView
  ) ->
    class Register extends ValidationView
      events: ->
        'click .js-register':   'registerAction'
        'click .js-update':     'updateAction'
        'click .nav':           'goToStep'

      bindings:
        '#interviewCaption':    'interviewCaption'
        '#subscribed':          'subscribed'
        '#password':            'password'
        '#interest':            'interest'
        '#homepage':            'homepage'
        '#email':               'email'
        '#dream':               'dream'
        '#name':                'name'
        '#img':                 'img'
        '#job':                 'job'

      className:                'page-layout m-page'
      tagName:                  'section'

      template:                 _.template(registerTpl)

      initialize: ->
        @handler()
        @model.set('maxLength', 290)

      handler: ->
        @listenTo(@model, 'change:interviewCaption', @symbolsCounter)

      ui: ->
        @.ui =
          counter: @$('.counter')

      setModels: ->
        @model = new UserUpdateModel(@model.toJSON())
        @stickit()
        @handler()

      render: ->
        @$el.empty().append(@template(@model.toJSON()))
        @onRender()
        @

      onRender: ->
        steps = @$el.find('fieldset')
        count = steps.size()
        @ui()

        @setImageUploader()

        steps.each( (step) ->
          steps
          .eq(step)
          .wrap('<div id="step' + step + '"></div>')
        )
        @showStep(0)
        @stickit()

      setImageUploader: ->
        new AjaxUpload(
          @$('#upload')[0],
          action: '/api/author/upload_user_image'
          name: 'files[]'
          id: 'upload'
          createInput: ->
          onComplete: (file, data) ->
            name = file.substr(0, file.indexOf('.'))
            image = data.dir + data.file_name
            if data.dir?
              @model.set('img', image)
        )

      goToStep: (event) ->
        $this = $(event.currentTarget)
        step = $this.data('count')
        if $this.hasClass('next')
          @showStep(step + 1)
        else
          @showStep(step - 1)

      showStep: (step) ->
        @$el.find("#step" + step)
        .show()
        .siblings()
        .hide()

      registerAction: (event) ->
        event.preventDefault()
        @hideErrors()
        @$(event.currentTarget).prop('disabled', yes)
        if @model.isValid()
          $.post('/api/author/register', @model.toJSON()
          , (data) =>
            if data.error is no
              @showStep(1)
              @setModels()
            else
              if data.errorType is 'emailExist'
                @$(event.currentTarget).prop('disabled', no)
                @showErrors([{
                  name: 'email'
                  message: 'Пользователь с таким email уже есть'
                }])
          , 'json')
        else
          @$(event.currentTarget).prop('disabled', no)
          @showErrors(@model.validationError)

      updateAction: (event) ->
        event.preventDefault()
        @hideErrors()
        @$(event.currentTarget).prop('disabled', yes)

        if @model.isValid()
          $.post('/api/author/editinfo', @model.toJSON()
          , (data) ->
            if data.authorData is yes
              window.location = '/#/author/posts/'
              window.location.reload(yes)
          , 'json')
        else
          @showErrors(@model.validationError)
          @showStep(1)
          @$(event.currentTarget).prop('disabled', no)
)