define [
  'models/base/model'
], (Model) ->

  class Queue extends Model
    data: []

    elements: []

    #
    initialize: ->
      super
      if not @elementName? then throw 'ElementName must be defined'
      if @paging
        @offset = 0
        @loadNext = (offsetStep=10) ->
          @offset += offsetStep
          @load

    #
    pushElement: (model) ->
      @elements.push(model)
      @elements.sort(@compare)


    #
    load: (callback)->
      @elements = []
      loadCallback = =>
        for elData in @data
          @elements.push(@createElementModel(elData))
        callback?()
      @request(loadCallback)
      @


    #
    compare: (a, b) ->
      if a.data.place < b.data.place then -1 else 1


    #
    updatePlaces: (callback) ->
      @requestData = {'map': @buildPlacesMap()}

      updateCallback = =>
        @elements.sort(@compare)
        callback?()

      @request(updateCallback)


    #
    getElementById: (id) ->
      for element in @elements
        if parseInt(element.data.id) is parseInt(id) then return element
      throw "no element with id #{id} found"

    #
    createElementModel: (elData) ->
      throw 'abstract method createElemenModel must be redefined'

    removeDeleted: (id) ->
      for element, key in @elements
        console.log element, key
        if not element.data.id?
          @elements.splice(key, 1)
          console.log 'spliced'


    #
    buildPlacesMap: ->
      placesMap = {}
      for element in @elements
        placesMap[element.data.place] = element.data.id
      return placesMap

