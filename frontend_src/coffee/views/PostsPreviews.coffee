define(
  [
    'text!templates/postPreviewsTpl.htm'
    'views/PaginationView'
    'views/PostPreview'
    'backbone'
  ]
(
  postPreviewsTpl
  PaginationView
  PostPreview
) ->
  class PostsPreviewsCollection extends PaginationView
    tagName: 'section'
    
    className: 'main-layout m-page'
    
    template: _.template(postPreviewsTpl)

    addOne: (item) ->
      item = new PostPreview({model: item})
      @itemsList.append(item.render().$el)
)