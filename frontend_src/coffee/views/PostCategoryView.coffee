define(
  [
    'text!templates/postCategoryTpl.htm'
    'backbone'
    'mediator'
  ]
(
  postCategoryTpl
) ->
  Backbone.View.extend({
    tagName: 'li'
    
    template: _.template(postCategoryTpl)

    events: ->
      'change input:checkbox': 'setCategories'

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

    setCategories: (event) ->
      check = if @$(event.currentTarget).is(':checked') then yes else no
      @model.set('checked', check)
      Backbone.Mediator.publish('category:checked')

  })
)