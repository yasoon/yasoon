define(
  [
    'views/TimelineAnswerView'
    'views/PaginationView'
    'backbone'
  ]
  (
    TimelineAnswerView
    PaginationView
  ) ->
    class TimelineAnswersList extends PaginationView
      tagName: 'section'

      initialize: ->
        @collection.each((answer)=> @addOne(answer))

      addOne: (answer) ->
        answerView = new TimelineAnswerView({model: answer})
        @$el.append(answerView.render().$el)
)