define(
  [
    'text!templates/reviewCategoriesTpl.htm'
    'text!templates/finedCategoriesTpl.htm'
    'views/PopUpView'
    'backbone'
  ]
  (
    reviewCategoriesTpl
    finedCategoriesTpl
    PopUpView
  ) ->
    class ReviewCategoriesView extends PopUpView
        
      initialize: (options) ->
        @options = options || {}

      events: ->
        _.extend {}, super,
          'click .connect p a'              : 'closePopup'
          'keyup input.category-for-review' : 'getCategories'
          'click .create-new-review'        : 'closePopup'
          
      className: 'barrier'

      template: _.template(reviewCategoriesTpl)
      categoriesTemplate: _.template(finedCategoriesTpl)

      render: ->
        @$el.empty().append(@template())
        super
        @onRender()
        @

      onRender: ->
        @$el.show()

      closePopup: ->
        $('.popUpBackground').click()
        
      getCategories: ->
        categoryText = $('input.category-for-review').val();
        if (categoryText.length >= 2)
          $.get("/api/post/get-reviews-categories/"+ categoryText, (data) => @checkErrors(data))
        else 
          $('.found-categories').hide()

        
      checkErrors: (data) ->
        if data.error is yes then @showError(data.errorText) else @setCategoriesData(data.result)
        
      setCategoriesData: (data) ->
        $('.found-categories').empty().append(@categoriesTemplate(_.extend({}, {'categories': data})))
        $('.found-categories').show()
      
      showError: (data) ->
        $('.found-categories').hide()
)