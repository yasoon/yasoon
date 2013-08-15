define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AdminTimelinePostModel extends Model
    name: 'TimelinePost'

    setChecked: (callback) ->
      console.log 'set checked'
      callback?()