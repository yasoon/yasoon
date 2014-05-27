define(
  [
    'backbone'
  ]
(
) ->
  class Pagination extends Backbone.Collection
    initialize: (options) ->
      @options = options || {}
    
    pagination: (perPage, page) ->
      page = page - 1
      collection = @
      collection = _(collection.rest(perPage*page))
      collection = _(collection.first(perPage))
      collection.map( (model) ->
        model
      )
)