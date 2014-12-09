define(
  [
    'text!templates/legoAllInterviewsTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    legoAllInterviewsTpl
    
  ) ->
    class LegoInterviewView extends Backbone.View

      tagName: 'section'

      className: 'page-layout row'

      template: _.template(legoAllInterviewsTpl)

      initialize: ->
        $.get("/api/interview/get_interviews_lego_all", {}, (data) => @checkErrors(data))

      checkErrors: (data) ->
        if data.error is yes then @showError(data) else @setInterviews(data)

      setInterviews: (data) ->
        @$el.empty().append(@template(_.extend({}, {'interviews': data.result})))

      showError: (data) ->
        @$el.empty().append('<div class="content">'+data.errorText+'</div>')

)
