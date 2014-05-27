define(
  [
    'text!templates/speakerInfoTpl.htm'
    'backbone'
    'mediator'
  ]
(
  speakerInfoTpl
) ->
  Backbone.View.extend({
    tagName: 'aside'
    
    className: 'postinfo'
    
    template: _.template(speakerInfoTpl)
  })
)