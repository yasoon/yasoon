define(
  [
    'text!templates/interviewTpl.htm'
    'backbone'
  ]
(
  interviewTpl
) ->
  Backbone.View.extend({
    tagName: 'li'
    
    template: _.template(interviewTpl)

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)