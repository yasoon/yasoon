define [
  'models/base/model'
], (Model) ->

  class Queue extends Model
    data: {}

    elements: []

    load: (callback)->
      @url    = -> 'api/blank_question/get_blank'
      @method = 'GET'
      @request(callback)
      @elements = @data.sort(@compare)

    compare: (a, b) ->
      if a.data.place < b.data.place then -1 else 1

    update: ->
      @url = -> "api/blank_question/update_places"