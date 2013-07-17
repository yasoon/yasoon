define [
         'models/base/queue'
         'models/people/author'
], (Queue, AuthorModel) ->
  'use strict'

  class PeopleAuthorQueueModel extends Queue
    name: 'PeopleAuthorQueue'
    elementName: 'PeopleAuthor'

    initialize: (params) ->
      super(params)
      @categoryId = params.categoryId

    load: (callback) ->
      @url    = -> 'api/people/get_authors/'+@categoryId
      @method = 'GET'
      super(callback)

    createElementModel: (elData) ->
      model = new AuthorModel()
      model.data = elData
      return model