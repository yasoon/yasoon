define(
  [
    'views/InterviewView'
    'views/ValidationView'
    'backbone'
    'stickit'
  ]
  (
    InterviewView
    ValidationView
  ) ->
    class PostInterviews extends ValidationView
      tagName: 'ul'

      className: 'list-unstyled'

      render: ->
        @collection.each((interview, iterator) => @addInterview(interview, iterator))
        @

      addInterview: (interview, iterator) ->
        interview.set('id', iterator)
        @addOne(interview)

      addOne: (interview) ->
        interview = new InterviewView({model: interview})
        @$el.append(interview.render().$el)
)