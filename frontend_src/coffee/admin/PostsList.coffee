define(
  [
    'text!templates/admin/postTpl.htm'
    'backbone'
  ]
  (
    postTpl
  )->
    class PostsList
      counter = 1

      Model = Backbone.Model.extend()

      Collection = Backbone.Collection.extend({
        model: Model
        url: "/admin/get_posts/#{counter}/10"
      })

      View = Backbone.View.extend({
        tagName: 'article'

        template: _.template(postTpl)

        events: ->
          'click .js-postOfTheDay': 'setPostOfTheDay'
          'click .js-delete': 'deletePost'

        setPostOfTheDay: (event) ->
          event.preventDefault()

          id = $(event.currentTarget).closest('article').data('postId')

          $.post("/api/post/set_daystory", {
            postId: id
          }, (data) ->
            $('.js-postOfTheDay').prop('disable', no)
            $(event.currentTarget).prop('disable', yes)
          , 'json')

        deletePost: (event) ->
          event.preventDefault()

          id = $(event.currentTarget).closest('article').data('postId')

          $.post("/api/post/deletePost", {
            post_id: id
          }, (data) ->
            if data.error is no
              $(event.currentTarget).closest('article').remove()
          , 'json')

        render: ->
          @$el
            .data('postId', @model.get('id'))
            .append(@template(@model.toJSON()))
          @
      })

      Views = Backbone.View.extend({
        initialize: ->
          @collection.fetch()
          @listenTo(@collection, 'add', @addOne)

        showMore: ->
          counter += 1
          @collection.fetch()

        addOne: (model) ->
          view = new View({model: model})
          $('#posts').append(view.render().$el)
      })

      list = new Views({
        collection: new Collection()
      })

    PostsList
)