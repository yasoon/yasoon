define(
  [
    'text!admin/templates/postTpl.htm'
    'backbone'
  ]
  (
    postTpl
  )->
    Backbone.View.extend({
      tagName: 'article'

      template: _.template(postTpl)

      events: ->
        'click .js-postOfTheDay': 'setPostOfTheDay'
        'click .js-delete': 'deletePost'

      setPostOfTheDay: (event) ->
        event.preventDefault()
        $.post("/api/post/set_daystory", {
          postId: @model.get('id')
        }, (data) ->
          $('.js-postOfTheDay').prop('disable', no)
          $(event.currentTarget).prop('disable', yes)
        , 'json')

      deletePost: (event) ->
        event.preventDefault()
        $.post("/api/post/deletePost", {
          post_id: @model.get('id')
        }, (data) ->
          if data.error is no
            $(event.currentTarget).closest('article').remove()
        , 'json')

      render: ->
        @$el.append(@template(@model.toJSON()))
        @
    })
)
