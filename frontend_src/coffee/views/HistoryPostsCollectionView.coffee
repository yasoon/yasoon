define(
  [
    'text!templates/historyStoriesTpl.htm'
    'views/HistoryPageStoryView'
    'backbone'
  ]
(
  historyStoriesTpl
  HistoryPageStoryView
) ->
  Backbone.View.extend({
    tagName: 'section'
    template: _.template(historyStoriesTpl)

    initialize: (options) ->
      @options = options || {}
      
    render: ->
      data = _.extend(@options, @options.description)
      @$el.empty().append(@template(data))

      @collection.each( (story) =>
        @addOne(story)
      )
      @

    addOne: (story) ->
      historyPageStoryView = new HistoryPageStoryView({model: story})
      @$el.append(historyPageStoryView.render().$el)

  })
)