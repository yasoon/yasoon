define(
  [
    'backbone'
  ]
(
) ->
  class ValidateModel extends Backbone.Model
    validate: (attrs) ->
      _.each(attrs, (attr) ->
        if typeof attr is 'string'
          $.trim(attr)
        else
          attr
      )
)