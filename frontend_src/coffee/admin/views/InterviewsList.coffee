define(
  [
    'admin/views/InterviewsView'
    'admin/views/InterviewAddFormView'
    'admin/collections/InterviewsCollection'
    'admin/models/InterviewModel'
    'backbone'
  ]
  (
    InterviewsView
    InterviewAddFormView
    InterviewsCollection
    InterviewModel
  )->
    class InterviewsList extends Backbone.View
      initialize: ->
        @createInterviewsList()
        @createInterviewAddForm()

      createInterviewsList: ->
        @interviewsCollection = new InterviewsCollection()
        if not @interviewsList?
          @interviewsList = new InterviewsView({collection: @interviewsCollection})
        else
          @interviewsList.delegateEvents()
        @$el.append(@interviewsList.render().$el)

      createInterviewAddForm: ->
        @interview = new InterviewModel()
        if not @interviewsAddForm?
          @interviewsAddForm = new InterviewAddFormView({model: @interview})
        else
          @interviewsAddForm.delegateEvents()
        @$el.append(@interviewsAddForm.render().$el)
)