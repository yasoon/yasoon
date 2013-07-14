define [
         'models/base/queue'
         'models/author/questions/question'
], (Queue, QuestionModel) ->
  'use strict'

  class AuthorQuestionsQuestionQueueModel extends Queue
    name: 'AuthorQuestionsQuestionQueue'
    elementName: 'AuthorQuestionsQuestion'

    initialize: (params) ->
      super
      @authorId = params.authorId

    load: (callback) ->
      @url    = -> 'api/author/get_questions/'+@authorId
      @method = 'GET'
      super(callback)

    updatePlaces: (callback) ->
      @url = -> 'api/author/update_questions_places/'+@authorId
      @method = 'POST'
      super(callback)

    createElementModel: (elData) ->
      model = new QuestionModel(authorId: elData.authorId)
      model.data = elData
      return model