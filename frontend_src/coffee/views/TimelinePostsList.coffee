define(
  [
    'views/TimelinePostView'
    'views/PaginationView'
    'backbone'
  ]
  (
    TimelinePostView
    PaginationView
  ) ->
    class TimelinePosts extends PaginationView
      tagName: 'section'

      initialize: ->
        @collection.each((post)=>
          @addOne(post)
        )
        $.get("/api/post/clearTimeline")

      addOne: (post) ->
        post = new TimelinePostView({model: post})
        @$el.append(post.render().$el)
)