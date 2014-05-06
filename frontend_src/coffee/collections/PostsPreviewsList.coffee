define(
  [
    'models/PostPreviewModel'
    'collections/Pagination'
    'backbone'
  ]
(
  PostPreviewModel
  Pagination
) ->
  class Stories extends Pagination
    model: PostPreviewModel
)