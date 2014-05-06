define(
  [
    'text!templates/speakersCategoryTpl.htm'
    'backbone'
  ]
(speakersCategoryTpl) ->
  Backbone.View.extend({
    tagName: 'li'
    template: _.template(speakersCategoryTpl)

    initialize: (options) ->
      @options = options || {}

    render: ->
      data = _.extend(@model.toJSON(), @options)
      @$el.html(@template(data))
      @

  })
)