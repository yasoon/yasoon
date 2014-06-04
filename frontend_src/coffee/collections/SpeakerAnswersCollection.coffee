define(
  [
    'models/AnswerModel'
    'backbone'
  ]
(
  AnswerModel
) ->
  Backbone.Collection.extend({
    model: AnswerModel
  })
)