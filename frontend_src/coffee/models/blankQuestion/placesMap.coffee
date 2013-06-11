define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class BlankQuestionsPlacesMap extends Model

    initialize: ->
      super
      @map =  []


    sync: (callback) ->
      return if @map.length is 0

      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data =
        map: @map

      @url = -> "api/blank_question/update_places"

      editCallback = =>
        callback?()

      @request(editCallback)
