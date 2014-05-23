define(
  [
    'text!templates/writePostFormTpl.htm'
    'views/PostCategories'
    'views/PostInterviews'
    'collections/CategoryCollection'
    'collections/InterviewCollection'
    'editor'
    'backbone'
    'stickit'
    'mediator'
    'bootstrap'
    'jqueryUi'
  ]
(
  writePostTpl
  PostCategories
  PostInterviews
  CategoryCollection
  InterviewCollection
) ->
  class WritePostPage extends Backbone.View
    events: ->
      'click button:submit': 'savePost'
#      'click button:reset': 'resetData'

    bindings:
      '#description': 'description'
      '#title': 'title'

#    subscriptions:
#      'category:checked': 'changeCategoryHeading'

    className: 'page-layout m-page'

    tagName: 'section'

    template: _.template(writePostTpl)

    initialize: ->
      @model.set('maxLength', 255)
      @handler()

    handler: ->
      @listenTo(@model, 'change:description', @symbolsCounter)

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

    createCategoryList: ->
      if not @postCategories?
        @postCategories = new PostCategories({
          collection: new CategoryCollection(Window.config.category)
        })
      @ui.categories.append(@postCategories.render().$el)

    createInterviewsList: ->
      $.get('/api/interview/questions/1'
      , (data) =>
        if not @postInterviews?
          @postInterviews = new PostInterviews({
            collection: new InterviewCollection(data)
          })
        @ui.interviews.append(@postInterviews.render().$el)
        @$('.editor').redactor('sync')
        @$('.sortable ul').sortable({
          cancel: '.form-group'
        })
      , 'json')

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

    changeCategoryHeading: ->
      names = @postCategories.checkedCategoriesNames()
      @$('.categoryHeading')
        .text(names)

    savePost: (event) ->
      event.preventDefault()
      fullText = @postInterviews.createFullText()
      categories = @postCategories.checkedCategories()
      if fullText
        @model.set({
          'text': fullText
          'category': categories
        })
        $.post('/api/post/savePost', {
          postData: @model.toJSON()
        }, (data) ->
          Backbone.Mediator.publish('post:submitted', data.postId)
        )

#    resetData: ->
#      console.log @
#      @changeCategoryHeading()
#      @postCategories.checkedCategories()

)