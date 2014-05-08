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
  ]
(
  registerTpl
  PostCategories
  PostInterviews
  CategoryCollection
  InterviewCollection
) ->
  Backbone.View.extend({
    events: ->
      'change .select input[type="checkbox"]': 'setCategories'
      'click .questionContent': 'editor'

    bindings:
      '#postDescription': 'postDescription'
      '#postTile': 'postTile'

    className: 'page-layout m-page'

    tagName: 'section'

    template: _.template(registerTpl)

    initialize: ->
      @model.set('maxLength', 255)
      @handler()

    handler: ->
      @listenTo(@model, 'change:postDescription', @symbolsCounter)

    ui: ->
      @.ui =
        counter: @$('.counter')
        categories: @$('.select')
        interviews: @$('.questions_list')

    render: ->
      @$el.empty().append(@template(@model.toJSON()))
      @onRender()
      @

    onRender: ->
      @stickit()
      @ui()
      @createCategoryList()
      @createInterviewsList()

    createCategoryList: ->
      $.get('/api/category/get_CategoryList'
      , (data) =>
        if not @postCategories?
          @postCategories = new PostCategories({
            collection: new CategoryCollection(data)
          })
        @ui.categories.append(@postCategories.render().$el)
      , 'json')

    createInterviewsList: ->
      $.get('/api/interview/questions/1'
      , (data) =>
        if not @postInterviews?
          @postInterviews = new PostInterviews({
            collection: new InterviewCollection(data)
          })
        @ui.interviews.append(@postInterviews.render().$el)
        @$('.editor').redactor()
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

    editor: (event) ->
      event.stopPropagation()
      event.preventDefault()
      console.log event

    setCategories: (event) ->
      categories = @$('input:checkbox:checked').map( (iterator, elem) ->
        $(@).val()
      ).get()
      @model.set('categories', categories)
      blocked = if categories.length > 2 then yes else no
      @$('input:checkbox:not(:checked)').prop('disabled', blocked)
  })
)