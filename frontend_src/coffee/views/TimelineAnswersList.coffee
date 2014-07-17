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
        @collection.each((post)=> @addOne(post))

      addOne: (post) ->
        post = new TimelineAnswerView({model: post})
        @$el.append(post.render().$el)
)