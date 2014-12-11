define(
  [
    'admin/models/InterviewModel'
    'backbone'
  ]
  (
    InterviewModel
  )->
    Backbone.Collection.extend({
      model: InterviewModel
      url: "/api/interview/get_interviews_admin"
    })
)