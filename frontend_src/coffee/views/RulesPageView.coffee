define(
  [
    'text!templates/aboutPageTpl.htm'
    'backbone'
  ]
  (
    aboutPageTpl
  ) ->
    class RulesView extends Backbone.View
      tagName: 'section'
      className: 'row'
      template: _.template(aboutPageTpl)
      render: ->
        @$el.empty().append(@template(_.extend({}, {'heading': ''}, {'text': _.getContent(5)}, {'image': _.getContent(71)})))
        @
)