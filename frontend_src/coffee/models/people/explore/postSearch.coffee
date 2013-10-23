define [
         'models/base/queue'
         'models/people/explore/post'
], (Queue, PostModel) ->
  'use strict'

  class PeopleExplorePostSearchModel extends Queue
    name: 'PeopleExplorePostQueue'
    elementName: 'PeopleExplorePost'

    initialize: (params) ->
      super(params)
      @text = params.text
      @mode = params.mode

    load: (callback) ->
      @url    = -> 'api/people/search_post_by_'+@mode+'/'+@text
      @method = 'GET'
      super(callback)

    createElementModel: (elData) ->
      model = new PostModel()
      model.data = elData
      return model