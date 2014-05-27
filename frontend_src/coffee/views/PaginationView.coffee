define(
  [
    'backbone'
  ]
(
) ->
  class PaginationView extends Backbone.View
    events: ->
      'click .downloadMore': 'updateCounter'

    initialize: (options) ->
      @options = options || {}
      @counter = 1
      @listenTo(@collection, 'add', @addOne)

    updateCounter: (event) ->
      event.preventDefault()
      ++@counter
      if @collection.length % @counter + 1 > 0
        @removeButton($(event.currentTarget))
      @onRender()

    removeButton: (elem) ->
      elem.parent().remove()
      
    render: ->
      data = @data || {}
      @$el.empty().append(@template(data))
      @itemsList = @$('.items-list')
      @onRender()
      @

    onRender: ->
      _.each(@collection.pagination(10, @counter), (item) =>
        @addOne(item)
      )

    # addOne: (item) ->
    #   item = new PostPreview({model: item})
    #   @items.append(item.render().$el)

)