define [
         'models/base/queue'
         'models/people/author'
], (Queue, AuthorModel) ->
  'use strict'

  class PeopleAuthorSearchModel extends Queue
    name: 'PeopleAuthorQueue'
    elementName: 'PeopleAuthor'

    initialize: (params) ->
      super(params)
      @searchText = params.text

    load: (callback) ->
      @url    = -> 'api/people/search_author/'+@searchText
      @method = 'GET'
      super(callback)

    createElementModel: (elData) ->
      model = new AuthorModel()
      model.data = elData
      return model