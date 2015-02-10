define(
  [
    'text!templates/legoAllInterviewsTpl.htm'
    'views/LegoFilterView'
    'backbone'
    'stickit'
    'bootstrap'
  ]
  (
    legoAllInterviewsTpl
    legoFilterView
    
  ) ->
    class LegoInterviewView extends Backbone.View

      tagName: 'section'

      className: 'page-layout row'

      template: _.template(legoAllInterviewsTpl)

      initialize: ->
        $.get("/api/interview/get_interviews_lego_best", {}, (data) => @checkErrors(data, 'best')) 
        
      events: ->
        'click .legoSelectType': 'selectByType'

      checkErrors: (data, type) ->
        if data.error is yes 
          @showError(data, type) 
        else 
          @setInterviews(data, type)

      setInterviews: (data, type) ->
        if type == 'all'
          $('.filterLegoContainer').empty().append(@template(_.extend({}, {'interviews': data.interviews}, {'options': ''})))
        else
          @getInterviewsByType()
          @$el.empty().append(@template(_.extend({}, {'interviews': data.interviews}, {'options': data.options})))

      showError: (data, type) ->
        if type == 'all'
          $('.filterLegoContainer').empty().append('<div class="content">'+data.errorText+'</div>')
        else 
          @$el.empty().append('<div class="content">'+data.errorText+'</div>')

      getInterviewsByType: (id = 0) ->
        $.get("/api/interview/get_interviews_by_type/" + id, {}, (data) => @checkErrors(data, 'all'))
        
      selectByType: (event) ->
        event.preventDefault()
        id = $(event.target).attr('data-id');
        @getInterviewsByType(id)
)
