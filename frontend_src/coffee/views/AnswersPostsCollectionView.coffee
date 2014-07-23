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
    class AnswersPostsCollectionView extends Backbone.View
      tagName: 'section'
      template: _.template(historyStoriesTpl)

      initialize: (options) ->
        @options = options || {}

      render: ->
        @$el.empty().append(@template(_.extend(@options, @options.description)))
        @collection.each( (story) => @addOne(story))
        @

      addOne: (story) ->
        history = new HistoryPageStoryView({model: story})
        @$el.append(history.render().$el)
)