define(
  [
    'models/CategoryModel'
    'backbone'
  ]
(
  CategoryModel
  ) ->
  Backbone.Collection.extend({
    model: CategoryModel
  })
)