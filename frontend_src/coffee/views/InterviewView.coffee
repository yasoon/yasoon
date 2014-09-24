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

    initialize: ->
      @listenTo(@model, 'change:text', @changeColor)

    bindings:
      'textarea': 'text'

    render: ->
      console.log(@model.toJSON())
      @$el.html(@template(@model.toJSON()))
      @stickit()
      @

    changeColor: ->
      question = @$('.a-quertion')
      # not actual length because text editor adds blank tags
      if @model.get('text').length > 0 then question.addClass('active') else question.removeClass('active')
  })
)