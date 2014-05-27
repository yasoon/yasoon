define(
  [
    'text!templates/postInterviewTpl.htm'
    'views/InterviewView'
    'backbone'
    'stickit'
  ]
(
  postInterviewTpl
  InterviewView
) ->
  Backbone.View.extend({
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

    showErrors: (error) ->
      @$('.redactor_box')
        .eq(error.id)
        .closest('.form-group')
        .removeClass('has-success')
        .addClass('has-error')
        .find('.help-block')
        .text(error.message)

    hideErrors: ->
      @$('.form-group')
        .removeClass('has-error')
        .addClass('has-success')
        .find('.help-block')
        .text('')

  })
)