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
        console.log(@collection)
        @collection.each((post)=>
          @addOne(post)
        )
        $.get("/api/question/clear_answer_timeline")

      addOne: (post) ->
        post = new TimelineAnswerView({model: post})
        @$el.append(post.render().$el)
)