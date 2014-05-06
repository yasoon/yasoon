define(
  [
    'models/SpeakerModel'
    'collections/Pagination'
    'backbone'
  ]
(
  SpeakerModel
  Pagination
) ->
  class SpeakerCollection extends Pagination
    model: SpeakerModel
)