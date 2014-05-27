define(
  [
    'text!templates/speakerInfoTpl.htm'
    'backbone'
  ]
(
  SpeakerInfoTpl
) ->
  Backbone.View.extend({
    tagName: 'aside'
    className: 'postinfo'
    template: _.template(SpeakerInfoTpl)
    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)