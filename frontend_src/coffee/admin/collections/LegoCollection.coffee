define(
  [
    'admin/models/LegoModel'
    'backbone'
  ]
  (
    LegoModel
  )->
    class LegoCollection extends Backbone.Collection
      model: LegoModel
)