define(
  [
    'text!templates/speakerInfoTpl.htm'
    'backbone'
  ]
(
  speakerInfoTpl
) ->
  Backbone.View.extend({
    tagName: 'aside'
    
    className: 'postinfo'
    
    template: _.template(speakerInfoTpl)
    
    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)