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
        @collection.each( (interview, iterator) =>
          interview.set('id', iterator)
          @addOne(interview)
        )
        @

      addOne: (interview) ->
        interview = new InterviewView({model: interview})
        @$el.append(interview.render().$el)

      createFullText: ->
        fullTextContainer = $('<div></div>')
        @hideErrors()
        @hasErrors = no
        _.each(@collection.models, (model, iterator) =>
          if not model.isValid()
            @hasErrors = yes
            data = _.extend(model.validationError[0], {id: iterator})
            @showErrors(data)
          else
            fullTextContainer.append(@template(model.toJSON()))
        )
        if not @hasErrors
          fullTextContainer.html()
        else
          not @hasErrors
)