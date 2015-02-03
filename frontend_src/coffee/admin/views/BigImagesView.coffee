define(
  [
    'text!admin/templates/bigImgsTpl.htm'
    'text!admin/templates/bigImgTpl.htm'
    'backbone'
  ]
  (
    bigImgsTpl
    bigImgTpl
  )->
    class BigImagesView extends Backbone.View

      template: _.template(bigImgsTpl)
      
      imgTemplate: _.template(bigImgTpl)

      render: ->
        @$el.html(@template())
        @onRender()
        @
        
      onRender: ->
        $.get('api/content/get_big_images', (data) => @show(data))

      show:(data) ->
        if data.error is no
          @showBigImages(data)

      showBigImages: (data) ->
        for index,values of data.data
          @$('.all-big-images-admin').append(@imgTemplate(_.extend({}, {id: index}, {url: values.text}, {title: values.title})))
          @setImageUploader(index)

      setImageUploader: (contentId) ->
        new AjaxUpload(
            @$('#uploadImg'+contentId)[0],
            action: '/api/content/upload_content_image/'+contentId
            name: 'files[]'
            id: contentId
            createInput: ->
            onComplete: (file, data) ->
              ret = JSON.parse(data)
              $('.uploadContentImg-'+ret.contentId).find('img').attr('src', "/web/upload#{ret.file_name}")
        )

)