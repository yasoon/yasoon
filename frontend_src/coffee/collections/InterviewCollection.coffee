define(
  [
    'models/InterviewModel'
    'backbone'
  ]
(
  InterviewModel
  ) ->
  Backbone.Collection.extend({
    model: InterviewModel
  })
)