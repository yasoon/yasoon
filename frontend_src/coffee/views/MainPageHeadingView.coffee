define(
  [
    'text!templates/mainPageHeadingTpl.htm'
    'text!templates/categoriesSearchResultTpl.htm'
    'backbone'
    'videoBG'
    'moderniz'
  ]
  (
    mainPageHeadingTpl
    categoriesSearchResultTpl
  ) ->
    class MainPageHeadingView extends Backbone.View
      className: 'mainPage-intro'
      
      template: _.template(mainPageHeadingTpl)
      
      categoriesTemplate: _.template(categoriesSearchResultTpl)
      
      events: ->
        'keyup input.category-for-review-main' : 'getCategoriesMain'
        
      render: ->
        @$el.html(@template()).css({'background-image': "url(web/upload#{_.getContent(13)})", 'background-size': "cover"})
        @onRender()
        @

      onRender: ->
        if (_.getContent(69) != '')
            setTimeout ( ->               
                if (Modernizr.video) 
                    BV = new $.BigVideo({container: $('.mainPage-intro')});
                    BV.init()
                    BV.show([
                        { type: "video/mp4",  src: "#{_.getContent(69)}.mp4" },
                        { type: "video/webm", src: "#{_.getContent(69)}.webm" },
                        { type: "video/ogg",  src: "#{_.getContent(69)}.ogg" },
                        {ambient:true}
                    ])
                    BV.getPlayer().on('durationchange', ( ->
                        $('#big-video-wrap').fadeIn();
                    ))
            ), 200
            
      getCategoriesMain: ->
        categoryText = $('input.category-for-review-main').val();
        if (categoryText.length >= 2)
          $.get("/api/post/search-categories/"+ categoryText, (data) => @checkErrorsMain(data))
        else 
          $('.found-categories-main').hide()

      checkErrorsMain: (data) ->
        if data.error is yes then @showErrorMain(data.errorText) else @setCategoriesDataMain(data.result)
        
      setCategoriesDataMain: (data) ->
        $('.found-categories-main').empty().append(@categoriesTemplate(_.extend({}, {'categories': data})))
        $('.found-categories-main').show()
      
      showErrorMain: (data) ->
        $('.found-categories-main').hide()
            

)