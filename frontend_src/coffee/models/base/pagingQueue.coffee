define [
  'models/base/queue'
], (Queue) ->

  class PagingQueue extends Queue

    stack:  []
    limit: 10

    firstLoad: true
    full: false

    initialize: ->
      @elements = []

    loadStack: (callback) ->
      @firstLoad = no
      @data = []
      @method = 'POST'
      @url = @stackUrl
      @requestData = {offset: @stack.length}

      loadCallback = =>
        if @data.length is 0 then @full = yes
        @stack = @stack.concat @data
        callback?()
      @request(loadCallback)

    makeLoad: (callback) ->
      loadCallback = =>
        count = 0
        for key, elData  of @data
          @elements.push(@createElementModel(elData))
          count++
        if count < @limit
          @full = yes
        callback?()

      @data = []
      @url = @loadUrl
      @method = 'POST'
      @requestData = {map: @stack[@elements.length..@elements.length+@limit-1]}
      @request(loadCallback)

    load: (callback) =>
      if not @full
        if @firstLoad or @elements.length is @stack.length
          @loadStack =>
            if not @full then @makeLoad(callback) else callback?()
        else
          @makeLoad(callback)