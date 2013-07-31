define [
  'models/base/queue'
], (Queue) ->

  class PagingQueue extends Queue

    stack:  []
    count:  0

    limit: 10


    loadStack: (callback) ->
      @method = 'POST'
      @url = @stackUrl
      @requestData = {offset: @elements.length}
      loadCallback = =>
        @stack = @stack.concat @data.stack
        @count = @data.count
        callback?()
      @request(loadCallback)

    makeLoad: (callback)->
      @data = []
      @url = @loadUrl
      @method = 'POST'
      @requestData = {map: @stack[@elements.length..@elements.length+@limit]}
      @request(callback)

#    #
    load: (callback)->
      loadCallback = =>
        for key, elData  of @data
          @elements.push(@createElementModel(elData))
        callback?()

      if @elements.length is @stack.length and @stack.length < @count
        @loadStack =>
          @makeLoad(loadCallback)

      else
        @makeLoad(loadCallback)



