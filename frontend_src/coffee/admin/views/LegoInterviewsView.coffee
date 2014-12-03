define(
  [
    'text!admin/templates/legoInterviewsTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    legoInterviewsTpl
  )->
    class LegoInterviewsView extends Backbone.View
      tagName: 'article'

      template: _.template(legoInterviewsTpl)
      
      initialize: (options) ->
        @options = options || {}

      render: ->
        console.log(@options)
        @$el.append(@template({interviews: @options}))
        @

      
)