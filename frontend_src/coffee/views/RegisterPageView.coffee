define(
  [
    'text!templates/registerTpl.htm'
    'models/UserUpdateModel'
    'fileupload'
    'backbone'
    'stickit'
    'mediator'
  ]
(
  registerTpl
  UserUpdateModel
) ->
  ### TODO:separate separate this big view to smaller views ###
  Backbone.View.extend({
    events: ->
      'click #register': 'registerAction'
      'click #update': 'updateAction'
      'click .nav': 'goToStep'

    bindings:
      '#description': 'description'
      '#subscribed': 'subscribed'
      '#password': 'password'
      '#username': 'username'
      '#interest': 'interest'
      '#homepage': 'homepage'
      '#email': 'email'
      '#dream': 'dream'
      '#img': 'img'
      '#job': 'job'

    className: 'page-layout m-page'

    tagName: 'section'

    template: _.template(registerTpl)

    initialize: ->
      @handler()
      @model.set('maxLength', 290)

    handler: ->
      @listenTo(@model, 'change:description', @symbolsCounter)

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

      steps.each( (step) ->
        steps
          .eq(step)
          .wrap('<div id="step' + step + '"></div>')
      )
      @showStep(0)
      @stickit()

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
      if @model.isValid()
        $.post('/api/author/register', @model.toJSON()
        , (data) =>
          if data.error is no
            @showStep(1)
            @setModels()
          else
            if data.errorType is 'emailExist'
              @showErrors([{
                name: 'email'
                message: 'Пользователь с таким email уже есть'
              }])
        , 'json')
      else
        @showErrors(@model.validationError)
    updateAction: (event) ->
      event.preventDefault()
      @hideErrors()

      if @model.isValid()
        $.post('/api/author/editinfo', @model.toJSON()
        , (data) ->
          console.log data
          if data.authorData is yes
            window.location = '/#author/';
        , 'json')
      else
        @showErrors(@model.validationError)
        @showStep(1)

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