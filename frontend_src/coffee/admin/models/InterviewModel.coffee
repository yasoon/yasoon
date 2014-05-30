define(
  [
    'admin/collections/InterviewsQuestionsCollection'
    'nestCollection'
    'backbone'
  ]
  (
    InterviewsQuestionsCollection
  )->
    class InterviewModel extends Backbone.Model
      set: (attributes, options) ->
        ret = Backbone.Model.prototype.set.call(@, attributes, options)
        if attributes.questions
          questions = new InterviewsQuestionsCollection(@get('questions'))
        else
          questions = new InterviewsQuestionsCollection()
        @questions = @nestCollection('questions', questions)
        ret
)