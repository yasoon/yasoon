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
        data = _.extend({}, {'heading': _.getContent(2)}, {'text': _.getContent(3)})
        @$el.empty().append(@template(data))
        console.log(@template(data))
        @
)