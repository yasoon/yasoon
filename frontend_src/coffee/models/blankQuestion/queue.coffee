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
          console.log question.data
          @questions.push(question)
        callback?()

      @url = -> 'api/blank_question/get_blank'

      @fetchParams =
        method: 'GET'
        data: {}

      @request fetchCallback


#    initialize: ->
#      super
#      @subscribeEvent 'postAdded', @postAddedHandler
#      @subscribeEvent 'postUpdated', @postUpdatedHandler
#
#    postAddedHandler: (post) ->
#      if @id is post.authorId
#        @data.splice(-1, 0, post)
#        @trigger 'updated'
#
#    postUpdatedHandler: (post) ->
#      console.log 'handler insnt implemented yet'
##      if @id is post.authorId
##        @data.unshift post
##        @trigger 'updated'
#
