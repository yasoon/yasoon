define(
  [
    'text!templates/reviewCategoriesTpl.htm'
    'text!templates/finedCategoriesTpl.htm'
    'text!templates/categoriesSearchTpl.htm'
    'text!templates/categoriesSearchResultTpl.htm'    
    'views/PopUpView'
    'backbone'
  ]
  (
    reviewCategoriesTpl
    finedCategoriesTpl
    categoriesSearchTpl
    categoriesSearchResultTpl
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
          'click .goPostsReviews'        : 'closePopup'
          
          
      className: 'barrier'

      template: _.template(reviewCategoriesTpl)
      
      categoriesTemplate: _.template(finedCategoriesTpl)
      
      searchTemplate: _.template(categoriesSearchTpl)
      
      searchCategoriesTemplate: _.template(categoriesSearchResultTpl)

      render: ->
        if @options.type == 'review'
          @$el.empty().append(@template())
        else
          @$el.empty().append(@searchTemplate())
        super
        @onRender()
        @

      onRender: ->
        @$el.show()
        $('.category-for-review').focus()

      closePopup: ->
        $('.popUpBackground').click()
        
      getCategories: ->
        categoryText = $('input.category-for-review').val();
        if (categoryText.length >= 2)
          if @options.type == 'review'
            $.get("/api/post/get-reviews-categories/"+ categoryText, (data) => @checkErrors(data))
          else if @options.type = 'search'
            $.get("/api/post/search-categories/"+ categoryText, (data) => @checkErrors(data))
        else 
          $('.found-categories').hide()

      checkErrors: (data) ->
        if data.error is yes then @showError(data.errorText) else @setCategoriesData(data.result)
        
      setCategoriesData: (data) ->
        if @options.type == 'review'
          $('.found-categories').empty().append(@categoriesTemplate(_.extend({}, {'categories': data})))
        else
          $('.found-categories').empty().append(@searchCategoriesTemplate(_.extend({}, {'categories': data})))
        $('.found-categories').show()
      
      showError: (data) ->
        $('.found-categories').hide()
)