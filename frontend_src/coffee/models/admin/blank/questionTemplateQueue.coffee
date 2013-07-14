define [
  'models/base/queue'
  'models/admin/blank/questionTemplate'
], (Queue, QuestionTemplateModel) ->
  'use strict'

  class AdminBlankQuestionTemplateQueueModel extends Queue
    name: 'AdminBlankQuestionTemplateQueue'
    elementName: 'AdminBlankQuestionTemplate'


    load: (callback)->
      @url    = -> 'api/blank_question/get_blank'
      @method = 'GET'
      super(callback)

    updatePlaces: (callback) ->
      @url = -> "api/blank_question/update_places"
      @method = 'POST'
      super(callback)

    createElementModel: (elData) ->
      model = new QuestionTemplateModel()
      model.data = elData
      return model