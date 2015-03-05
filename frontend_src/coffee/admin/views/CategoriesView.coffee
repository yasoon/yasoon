define(
  [
    'text!admin/templates/categoriesTpl.htm'
    'admin/views/EditCategoryView'
    'admin/models/CategoriesModel'
    'backbone'
    'mediator'
    'bootstrap'
  ]
  (
    categoriesTpl
    EditCategoryView
    CategoriesModel
  )->
    class CategoriesView extends Backbone.View
      
      initialize: (options)->
        @model = new CategoriesModel()
        @model.set('category', options.id)
        @
        
      template: _.template(categoriesTpl)

      render: ->
        @getCategories()
        @

      getCategories: ->
        $.get("/api/post/get_categories/"+parseInt(@model.get('category')), (data) => @checkCategoryErrors(data))
      
      checkCategoryErrors: (data) ->
        if data.error is yes then @setEmpty(data.errorText)
        else @setDataCategories(data) 
        
        
      setEmpty: (text) ->
        if not @emptyView? then @emptyView = new EmptyView({message:text}) else @emptyView.delegateEvents()
        @$el.append(@emptyView.render().$el)
        
      setDataCategories: (data) ->
        if data.path? then @model.set('path', data.path)
        if data.result.parent? then @model.set('parent', data.result.parent)
        path =  data.path ? ''
        parent = data.result.parent ? 0
        $('#categories').html(@template(_.extend({}, {'path': path}, {'parent': parent}, {'categories': data.result.categories})))

)