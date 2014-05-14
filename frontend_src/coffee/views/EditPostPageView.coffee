define(
  [
    'text!templates/writePostFormTpl.htm'
    'views/PostCategories'
    'views/PostInterviews'
    'views/NewPostPageView'
    'collections/CategoryCollection'
    'collections/InterviewCollection'
    'editor'
    'backbone'
    'stickit'
    'mediator'
    'bootstrap'
  ]
(
  registerTpl
  PostCategories
  PostInterviews
  NewPostPageView
  CategoryCollection
  InterviewCollection
) ->
  class WritePostPage extends NewPostPageView
    bindings:
      '#postDescription': 'postDescription'
      '#postTitle': 'postTitle'

    className: 'page-layout m-page'

    tagName: 'section'

    template: _.template(registerTpl)

    initialize: ->
      console.log @
      @model.set('maxLength', 255)
      @handler()

    handler: ->
      @listenTo(@model, 'change:postDescription', @symbolsCounter)

    ui: ->
      @.ui =
        counter: @$('.counter')
        categories: @$('#categoryList')
        interviews: @$('#questionsList')

    render: ->
      @$el.empty().append(@template(@model.toJSON()))
      @onRender()
      @

    onRender: ->
      @stickit()
      @ui()
      @createCategoryList()
      @createInterviewsList()
      $('.collapse').collapse()

)