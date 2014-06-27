define(
  [
    'text!templates/postInterviewTpl.htm'
    'views/InterviewView'
    'views/ValidationView'
    'backbone'
    'stickit'
  ]
  (
    postInterviewTpl
    InterviewView
    ValidationView
  ) ->
    class PostInterviews extends ValidationView
      tagName: 'ul'

      className: 'list-unstyled'

      template: _.template(postInterviewTpl)

      render: ->
        @collection.each(
          (interview, iterator) =>
            interview.set('id', iterator)
            @addOne(interview)
        )
        @

      addOne: (interview) ->
        interview = new InterviewView({model: interview})
        @$el.append(interview.render().$el)

      createFullText: ->
        fullTextContainer = $('<div></div>')
        _.each(@collection.models, (model) =>
          if model.get('text')?
            fullTextContainer.append(@template(model.toJSON()))
        )
        fullTextContainer.html()
)