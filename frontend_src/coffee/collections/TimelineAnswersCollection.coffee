define(
  [
    'models/TimelineAnswerModel'
    'collections/Pagination'
    'backbone'
  ]
  (
    TimelineAnswerModel
    Pagination
  ) ->
    class TimelineAnswersCollection extends Pagination
      model: TimelineAnswerModel
)