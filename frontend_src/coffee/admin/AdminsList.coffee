define(
  [
    'text!templates/admin/adminTpl.htm'
    'backbone'
  ]
  (
    adminTpl
  )->
    class AdminsList

      Model = Backbone.Model.extend()

      Collection = Backbone.Collection.extend({
        model: Model
        url: '/admin/get_admins'
      })

      View = Backbone.View.extend({
        template: _.template(adminTpl)

        render: ->
          @$el.append(@template(@model.toJSON()))
          @
      })

      Views = Backbone.View.extend({
        initialize: ->
          @collection.fetch()
          @listenTo(@collection, 'add', @addOne)

        addOne: (admin) ->
          Admin = new View({model: admin})
          $('#adminsList').append(Admin.render().$el)
      })

      list = new Views({
        collection: new Collection()
      })

    AdminsList
)