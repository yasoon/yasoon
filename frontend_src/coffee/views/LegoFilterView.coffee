define(
  [
    'text!templates/legoFilterTpl.htm'
    'text!templates/legoAllInterviewsTpl.htm'
    'backbone'
    'mediator'
    'bootstrap'
  ]
  (
    legoFilterTpl
    legoAllInterviewsTpl
  ) ->
    class WritePostPage extends Backbone.View
      template: _.template(legoFilterTpl)
      
      templateInterview: _.template(legoAllInterviewsTpl)

      events: ->
        'change .interviewSelectType': 'replaceInterviews'

      initialize: ->
        @getInterviewsById()

      checkErrors: (data) ->
        if data.error is yes then @showError(data) else @setInterviews(data)

      setInterviews: (data) ->
        $('.filteredInterviews').empty().append(@templateInterview(_.extend({}, {'interviews': data.result})))

      showError: (data) ->
        @$el.empty().append('<div class="content">'+data.errorText+'</div>')
        
      getInterviewsById: (id = 0) ->
        $.get("/api/interview/get_interviews_by_type", {''}, (data) => @checkErrors(data))
)