define(
  [
    'models/HistoryPagePostsModel'
    'backbone'
  ]
(
  HistoryPagePostsModel
) ->
  Backbone.Collection.extend({
    model: HistoryPagePostsModel
  })
)