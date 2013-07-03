define [
  'chaplin',
  'models/base/model'
  'models/author/question'
], (Chaplin, Model, Question) ->
  'use strict'

  class InterviewQueue extends Model

    initialize:(obj) ->
      @questions = []
      super
      @authorId = obj.authorId if obj.authorId?

    fetch: (callback) ->
      fetchCallback = =>
        for questionData in @data
          question = new Question
          question.data = questionData
          @questions.push(question)
        callback?()

      @url = -> "api/author/get_blank/1" #TODO REAL AUTHOR ID!
      @fetchParams =
        method: 'GET'
        data: {}

      @request fetchCallback