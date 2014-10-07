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
    
#    className: 'main-layout m-page'
    
    template: _.template(postPreviewsTpl)

    initialize: (options) ->
      @sort = options.sort
      @category = options.category
      super

    updateCounter: (event) ->
      event.preventDefault()
      @updateCollection()
      ++@counter
      @onRender()

    updateCollection: () ->
      counter = @counter + 1
      $.get("/api/post/get_categoryPosts/#{@category}/#{counter}/10",
      (data) =>
        max = data['postsCount']
        data = data[@sort]
        @collection.add(data)
        if @collection.length is max
          @removeButton(@$('.downloadMore'))
      ,'json')

    addOne: (item) ->
      item = new PostPreview({model: item})
      @itemsList.append(item.render().$el)
)