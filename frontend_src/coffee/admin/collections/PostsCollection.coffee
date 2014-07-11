define(
  [
    'admin/models/PostModel'
    'backbone'
  ]
  (
    PostModel
  )->
    class PostsCollection extends Backbone.Collection
      model: PostModel
      url: ->
        counter = @size() % 10 + 1
        "/api/post/get_categoryPosts/0/#{counter}/10"
)