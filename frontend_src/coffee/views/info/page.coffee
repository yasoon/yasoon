define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
         'models/register/register'
         'views/info/info'
], (PageView,
    JST,
    FooterView,
    HeaderView
    InfoModel
    InfoView
) ->
  'use strict'

  class InfoPageView extends PageView
    className: 'infoPage'

    regions:
      'footer': 'footer'
      'header': 'header'
      'info' : '#page-layout'

    templateName: 'info_page'

    render: ->
      super
      new HeaderView()
      new FooterView()

      infoModel = new InfoModel()
      infoModel.load =>
        infoView = new InfoView(model:infoModel)
        infoView.setRegion('info').setMode('edit')
        console.log infoModel
        $('#fileupload').fileupload({
          dataType: 'json',
          autoUpload: true,
          number: 1,
          done: (e, file) ->
            file = file.result
            fileName = file.dir + file.file_name
            $(".files_success_upload").html('<img src="' + fileName + '" width="53" height="53"/>')
            $(".btn_upload_img").text("Изменить изображение")
        })

        pressFooter()


