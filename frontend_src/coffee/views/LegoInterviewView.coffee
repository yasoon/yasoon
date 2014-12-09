define(
  [
    'text!templates/legoInterviewsTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    legoInterviewsTpl
    
  ) ->
    class LegoInterviewView extends Backbone.View
      events: ->
        'click .js-open':   'openQuestion'

      tagName: 'section'

      className: 'page-layout row'

      template: _.template(legoInterviewsTpl)

      initialize: (options) ->
        $.get("/api/interview/get_interviews_lego/" + options.id, {}, (data) => @checkErrors(data))

      checkErrors: (data) ->
        if data.error is yes then @showError(data) else @setInterviewData(data.interviewData)

      setInterviewData: (data) ->
        @$el.empty().append(@template(_.extend({}, {'questions': data.questions}, {'title': data.interviewTitle}, {'id': data.interviewId})))

      showError: (data) ->
        @$el.empty().append('<div class="content">'+data.errorText+'</div>')

      openQuestion: (event) ->
        event.preventDefault()
        $(event.currentTarget).next().slideToggle()
)
