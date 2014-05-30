define(
  [
    'admin/models/ContentModel'
    'backbone'
  ]
  (
    ContentModel
  )->
    Backbone.Collection.extend({
      model: ContentModel
      url: "/api/content/get_all"
    })
)