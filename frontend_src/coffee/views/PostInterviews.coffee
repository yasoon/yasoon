define(
  [
    'views/InterviewView'
    'backbone'
  ]
(
  InterviewView
) ->
  Backbone.View.extend({
    render: ->
      @interviewsList = $('<ul class="list-unstyled"></ul>')

      @collection.each( (interview) =>
        interview.set(@data)
        @addOne(interview)
      )
      @$el.empty().append(@interviewsList)

      @

    addOne: (interview) ->
      interview = new InterviewView({model: interview})
      @interviewsList.append(interview.render().$el)

  })
)