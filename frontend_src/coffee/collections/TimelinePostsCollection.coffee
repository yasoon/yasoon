define(
  [
    'models/TimelinePostModel'
    'collections/Pagination'
    'backbone'
  ]
  (
    TimelinePostModel
    Pagination
  ) ->
    class TimelinePostsCollection extends Pagination
      model: TimelinePostModel
)