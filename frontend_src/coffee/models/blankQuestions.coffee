define [
  'chaplin',
  'models/base/model'
  'models/blankQuestion'
], (Chaplin, Model, BlankQuestion) ->
  'use strict'

  class BlankQuestions extends Model
    fetch: (callback) ->
      @url = -> "api/blank_question/get_blank"
      @fetchParams =
        method: 'GET'
        data: {}

      @questions = []
      fetchCallback = =>
        @questions.push(new BlankQuestion(questionData)) for questionData in @data
        callback()


      @request(fetchCallback)



    initialize: ->
      super
      @subscribeEvent 'postAdded', @postAddedHandler

    postAddedHandler: (post) ->
      if @id is post.authorId
        @data.unshift post
        @trigger 'updated'
