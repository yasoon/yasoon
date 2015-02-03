define(
  [
    'text!templates/aboutPageTpl.htm'
    'backbone'
  ]
  (
    aboutPageTpl
  ) ->
    class AboutView extends Backbone.View
      tagName: 'section'
      className: 'row'
      template: _.template(aboutPageTpl)
      render: ->
        @$el.empty().append(@template(_.extend({}, {'heading': _.getContent(2)}, {'text': _.getContent(3)}, {'image': _.getContent(70)})))
        @
)