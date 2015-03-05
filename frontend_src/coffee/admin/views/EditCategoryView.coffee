define(
  [
    'text!admin/templates/categoryEditTpl.htm'
    'text!admin/templates/oneCategoryTpl.htm'
    'views/PopUpView'
    'admin/views/CategoriesView'
    'backbone'
  ]
  (
    categoryEditTpl
    oneCategoryTpl
    PopUpView
    CategoriesView
    
  ) ->
    class EditCategoryView extends PopUpView
        
      initialize: (options) ->
        @options = options || {}
        @
      

      events: ->
        _.extend {}, super,
          'click .connect p a': 'closePopup'
          'click .js-cancel': 'closePopup'
          'click .js-save': 'saveCategory'
          'click .remove-category': 'removeCategory'
          
      className: 'barrier'

      template: _.template(categoryEditTpl)
      
      oneCategoryTemplate: _.template(oneCategoryTpl)

      render: ->
        @$el.empty().append(@template())
        super
        @onRender()
        @

      onRender: ->
        @$el.show()
        @addCategory()

      closePopup: ->
        $('.popUpBackground').click()

      addCategory: ->
        $.get("/api/post/get_category_edit/"+@options.id+"/"+@options.parent, (data) =>
          $('.connect').empty().append(@oneCategoryTemplate(
            _.extend({},
              {categoryTitle: data.result.name},
              {categoryId: data.result.id},
              {categoryDescription: data.result.description},
              {categoryParent: data.result.parent}
            )
          ))
        )
        
      saveCategory: (event) ->
        event.preventDefault()
        formData = $('form.category-edit-form').serialize()
        $.post('/api/post/save_category', {formData}, (data) => @changeLocation(data))
        
      changeLocation: (data) ->
        if data.error is yes
          alert(data.errorText)
        else
          @closePopup()
          Backbone.trigger('child-click-event', data);
          
)