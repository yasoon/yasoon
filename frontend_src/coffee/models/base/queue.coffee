define [
  'models/base/model'
], (Model) ->

  class Queue extends Model
    data: []

    elements: []

    load: (callback)->
      loadCallback = =>
        for elData in @data
          @elements.push(@createElementModel(elData))
        callback?()
      @request(loadCallback)
      @

    compare: (a, b) ->
      if a.data.place < b.data.place then -1 else 1

    updatePlaces: (callback) ->
      @requestData = {'map': @buildPlacesMap()} 

      updateCallback = =>
        @elements.sort(@compare)
        callback?()

      @request(updateCallback)

    getElementById: (id) ->
      for element in @elements
        if parseInt(element.data.id) is parseInt(id) then return element
      throw "no element with id #{id} found"

    createElementModel: (elData) ->
      throw 'abstract method createElemenModel must be redefined'

    buildPlacesMap: ->
      placesMap = {}
      for element in @elements
        placesMap[element.data.place] = element.data.id
      return placesMap