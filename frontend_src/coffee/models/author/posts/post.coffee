define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorPostsPostModel extends Model
    name: 'AuthorPostsPost'

    #
    initialize: (params)->
      super(params)
      @authorId = params.authorId
      @id = params.id

    load: (callback) ->
      @method = 'GET'
      @url = -> 'api/post/get/'+@id
      @requestData = {}
      @request(callback)


    #
    update: (callback) ->
      if not @validateNotNull('caption', 'preview', 'text')
        @publishEvent 'publicError', 'Заголовок, превью и тело поста не могут быть пустыми'
        return

      @method = 'POST'
      @url    = -> 'api/post/update'
      @requestData =
        model:
          id: @data.id
          caption: @data.caption
          text:  @data.text
          preview:  @data.preview
          authorId: @authorId
          categoryId: @data.categoryId

      updateCallback = =>
        @publishEvent 'modelUpdated', @
        callback?()

      @request(updateCallback)


    #
    add: (callback) ->
      if not @validateNotNull('caption', 'preview', 'text')
        @publishEvent 'publicError', 'Заголовок, превью и тело поста не могут быть пустыми'
        return

      @method = 'POST'
      @url    = -> 'api/post/add'
      @requestData =
        model:
          caption:  @data.caption
          authorId: @authorId
          text:  @data.text
          preview:  @data.preview
          categoryId: @data.categoryId

      addCallback = =>
        addedModel = new AuthorPostsPostModel(@authorId)
        addedModel.data = id: @data.id, place: @data.place, caption: @data.caption,  date: @data.date
        @data = {}

        @publishEvent 'modelAdded', addedModel
        callback?()

      @request(addCallback)


    #
    delete: (callback) ->
      @method = 'POST'
      @url    = -> 'api/post/delete'
      @requestData = model: id: @data.id

      deleteCallback = =>
        @publishEvent 'modelDeleted', @data.id
        callback?()

      @request(deleteCallback)
