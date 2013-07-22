define [
         'models/base/queue'
         'models/people/explore/post'
], (Queue, PostModel) ->
  'use strict'

  class PeopleExplorePostQueueModel extends Queue
    name: 'PeopleExplorePostQueue'
    elementName: 'PeopleExplorePost'

    initialize: (params) ->
      super(params)
      @categoryId = params.categoryId
      @mode = params.mode

    load: (callback) ->
      if @mode is 'date'
        @url    = -> 'api/people/get_posts_date/'+@categoryId
      else
        @url    = -> 'api/people/get_posts_rating/'+@categoryId
      @method = 'GET'
      super(callback)

    createElementModel: (elData) ->
      model = new PostModel()
      model.data = elData
      return model