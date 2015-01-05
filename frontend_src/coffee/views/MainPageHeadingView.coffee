define(
  [
    'text!templates/mainPageHeadingTpl.htm'
    'backbone'
    'videoBG'
    'moderniz'
  ]
  (
    mainPageHeadingTpl
  ) ->
    class MainPageHeadingView extends Backbone.View
      className: 'mainPage-intro'
      template: _.template(mainPageHeadingTpl)
      render: ->
        @$el.html(@template()).css({'background-image': "url(frontend#{_.getContent(13)})", 'background-size': "cover"})
        @onRender()
        @

      onRender: ->
        if (_.getContent(69) != '')
            setTimeout ( ->               
                if (Modernizr.touch) 
                    
                else
                    BV = new $.BigVideo({container: $('.mainPage-intro')});
                    BV.init()
                    BV.show([
                        { type: "video/mp4",  src: "#{_.getContent(69)}.mp4" },
                        { type: "video/webm", src: "#{_.getContent(69)}.webm" },
                        { type: "video/ogg",  src: "#{_.getContent(69)}.ogg" },
                        {ambient:true}
                    ])
            ), 300

)