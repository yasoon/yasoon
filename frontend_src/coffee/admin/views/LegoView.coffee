define(
  [
    'text!admin/templates/legoTpl.htm'
    'text!admin/templates/legoInterviewsTpl.htm'
    'admin/views/LegoInterviewsView'
    'backbone'
    'stickit'
  ]
  (
    legoTpl
    legoInterviewsTpl
    LegoInterviewsView
  )->
    class LegoView extends Backbone.View
      
      tagName: 'article'

      className: 'interview'

      template: _.template(legoTpl)

      initialize: ->
        @getInterviewsList()

      getInterviewsList: ->
        $.post('/api/interview/get_interviews_all', {}, (data) => 
            if data 
                interview = new LegoInterviewsView({data: data})
                @$el.append(interview.render().$el)
        )
)