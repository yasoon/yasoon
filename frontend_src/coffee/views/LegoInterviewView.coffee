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
      tagName: 'section'

      className: 'page-layout row'

      template: _.template(legoInterviewsTpl)

      initialize: (options) ->
        $.get("/api/interview/get_interviews_lego/" + options.id, {}, (data) => @checkErrors(data))

      checkErrors: (data) ->
        if data.error is yes then @showError(data.errorType) else @setInterviewData(data.interviewData)

      setInterviewData: (data) ->
        @$el.empty().append(@template(_.extend({}, {'questions': data.questions})))
)
