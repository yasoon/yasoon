define(
  [
    'text!templates/interviewTpl.htm'
    'backbone'
    'stickit'
  ]
(
  interviewTpl
) ->
  Backbone.View.extend({
    tagName: 'li'
    
    template: _.template(interviewTpl)

    bindings:
      'textarea': 'text'

    render: ->
      @$el.html(@template(@model.toJSON()))
      @stickit()
      @

  })
)