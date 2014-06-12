define(
  [
    'text!templates/answersListTpl.htm'
    'views/ValidationView'
    'views/LoginPopUpView'
    'models/PostAuthorModel'
    'backbone'
    'stickit'
  ]
  (
    answersListTpl
    ValidationView
    LoginPopUpView
    PostAuthorModel
  ) ->
    class QuestionFormView extends ValidationView
      template: _.template(answersListTpl)
      className: 'question-form'

      events: ->
        'submit form': 'setQuestion'

      bindings:
        '#question': 'question'

      initialize: (options) ->
        @options = options or {}
        @$el.append(@template())
        @stickit()


      setQuestion: (event) ->
        event.preventDefault()
        @hideErrors()
        target = @$(event.currentTarget)
        if typeof Window.config.userId is "number"
          if @model.isValid()
            target.find('button').prop('disabled', yes)
            $.post('/api/question/add', {model: @model.toJSON()}, () =>
              newMessageText = _.getContent(64)
              newMessageFrag = $("<p>#{newMessageText}</p>")
              @model.set('savedQuestion', @model.get('question'))
              target.find('textarea').val('').closest('section').find('.answers').append(newMessageFrag)
              window.setTimeout(->
                target.find('button').prop('disabled', no).closest('section').find('.answers').empty()
              , 3000)
            )
          else
            @showErrors()
        else
          if not @loginpopUpView?
            @loginpopUpView = new LoginPopUpView({
              model: new PostAuthorModel()
            })
          else
            @loginpopUpView.delegateEvents()
          $('body').append(@loginpopUpView.render().$el)
)