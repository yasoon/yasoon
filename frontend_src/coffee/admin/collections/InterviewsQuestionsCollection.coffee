define(
  [
    'admin/models/InterviewQuestionModel'
    'backbone'
  ]
  (
    InterviewQuestionModel
  )->
    Backbone.Collection.extend({
      model: InterviewQuestionModel
    })
)