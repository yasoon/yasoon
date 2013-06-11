define [
  'chaplin',
  'models/base/model'
  'models/blankQuestion/model'
], (Chaplin, Model, BlankQuestion) ->
  'use strict'

  class BlankQuestionsQueue extends Model
    questions: []

    fetch: (callback) ->

      fetchCallback = =>
        for questionData in @data
          question = new BlankQuestion
          question.data = questionData
          @questions.push(question)
        callback?()

      @url = -> 'api/blank_question/get_blank'

      @fetchParams =
        method: 'GET'
        data: {}

      @request fetchCallback

