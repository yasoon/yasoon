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
        if not @interviewsList?
          @interviewsList = new InterviewsView({collection: new InterviewsCollection()})
        else
          @interviewsList.delegateEvents()
        @$el.append(@interviewsList.render().$el)

      createInterviewAddForm: ->
        if not @interviewsAddForm?
          @interviewsAddForm = new InterviewAddFormView({model: new InterviewModel()})
        else
          @interviewsAddForm.delegateEvents()
        @$el.append(@interviewsAddForm.render().$el)
)