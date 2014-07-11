define(
  [
    'admin/models/ContentModel'
    'backbone'
  ]
  (
    ContentModel
  )->
    class ContentsCollection extends Backbone.Collection
      model: ContentModel
      url: "/api/content/get_all"
)