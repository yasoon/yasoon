define [
         'models/base/pagingQueue'
         'models/author/questions/question'
], (PagingQueue, QuestionModel) ->
  'use strict'

  class AuthorQuestionsQuestionQueueModel extends PagingQueue
    name: 'AuthorQuestionsQuestionQueue'
    elementName: 'AuthorQuestionsQuestion'

    initialize: (params) ->
      super
      @authorId = params.authorId

    loadUrl: -> 'api/author/get_questions'
    stackUrl: -> 'api/author/get_questions_stack/'+@authorId


    updatePlaces: (callback) ->
      @url = -> 'api/author/update_questions_places/'+@authorId
      @method = 'POST'
      super(callback)

    createElementModel: (elData) ->
      model = new QuestionModel(authorId: elData.authorId)
      model.data = elData
      return model