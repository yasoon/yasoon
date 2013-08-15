define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AdminContentRowModel extends Model
    name: 'AdminContentRow'

    update: (callback) ->
      if not @validateNotNull('description', 'text')
        @publishEvent 'publicError', 'Текст и описание не могут быть пустыми'
        return

      @method = 'POST'
      @url    = -> 'api/content/edit'
      @requestData =
        model:
          id: @data.id
          text:  @data.text
          description: @data.description

      updateCallback = =>
        @publishEvent 'modelUpdated', @
        callback?()

      @request(updateCallback)