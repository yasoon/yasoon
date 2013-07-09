define [
         'views/base/view'
         'JST'
         'models/blankQuestion/model'
         'views/blankQuestion/view',
         'jqueryui',
         'models/blankQuestion/placesMap'
], (View, JST, BlankQuestion, BlankQuestionView, Sortable, PlacesMap) ->
  'use strict'

  class BlankQuestionsQueueView extends View
    className: 'blankQuestionList'
    autoRender: true
    region: 'queue'
    regions:
      '#list': 'list'

    templateName: 'blankQuestion_queue'

    initialize: ->
      super
      @subscribeEvent 'blankQuestionAdded',   @addQuestion
      @subscribeEvent 'blankQuestionDeleted', @deleteQuestion

    addQuestion: (question) ->
      @model.questions.push(question)
      @render()

    deleteQuestion: (question) ->
      for qst, key in @model.questions
        if qst.data.id is question.data.id
          @model.questions.splice(key, 1)
          break

      @$el.find("##{question.data.id}").remove()

      @refreshOrder()

    buildPlacesMap: ->
      placesMap = new PlacesMap()
      for question in @$el.find('.question')
        placesMap.map.push($(question).attr('id'))
      return placesMap

    refreshOrder: ->
      placesMap = @buildPlacesMap()
      newOrder = []
      for question in @model.questions
        question.data.place = placesMap.map.indexOf(''+question.data.id) + 1
        newOrder[placesMap.map.indexOf(''+question.data.id)] = question
      @model.questions = newOrder

      placesMap.sync()
      @render()

    render: ->
      super
      for question in @model.questions
        (new BlankQuestionView(model: question)).setRegion('list').setPassiveMode()
      @$el.find('#list').sortable(
        cursor: 'move'
        update: =>
          @refreshOrder()
      )

