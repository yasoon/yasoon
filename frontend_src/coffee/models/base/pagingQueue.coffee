define [
  'models/base/queue'
], (Queue) ->

  class PagingQueue extends Queue

    stack:  []
    offset: 0
    limit:  10

    fullyLoaded: false

    loadStack: (callback) ->
      console.log 'stack'
      @method = 'POST'
      @url = @stackUrl
      @requestData = {offset: @offset}
      loadCallback = =>
        @stack = @stack.concat @data
        callback?()
      @request(loadCallback)

    makeLoad: (loadCallback)->
      callback =  ->
        @offset += @limit
        loadCallback?()
      @data = []
      @url = @loadUrl
      @method = 'POST'
      @requestData = {map: @stack[@offset..@limit]}
      @request(callback)

#    #
    load: (callback)->
      loadCallback = =>
        console.log @data
        for key, elData  of @data
          console.log @elData
          @elements.push(@createElementModel(elData))
        callback?()

      if @stack.length < @offset + @limit
        @loadStack =>
          @makeLoad(loadCallback)

      else
        @makeLoad(loadCallback)
