define(
  [
    'text!templates/writeReviewTpl.htm'
    'views/ValidationView'
    'editor'
    'backbone'
    'stickit'
    'mediator'
    'bootstrap'
    'bootstrap-rating'
    'jqueryUi'
    'multiselect-filter'
    'jquery-multiselect'
  ]
  (
    writeReviewTpl
    ValidationView

  ) ->
    class NewReviewPageView extends ValidationView
      events: ->
        'click :submit':                  'saveReview'
        'click .js-cancel':               'cancelReview'
        'click .addLike':                 'addLike'
        'click .expert':                  'selectExpert'
        'click .write-good-story-title':  'showHint'
        'keyup #description':             'validateDescription'
        'focus .redactor_editor':         'removePlaceholder'
        'focusout .redactor_editor':      'addPlaceHolder'
        
      bindings:
        '#description':              'description'
        '#title':                    'title'
        '#text':                     'text'
        '#reviewType':               'reviewType'
        
      className:                    'page-layout m-page'
      tagName:                      'section'

      template:                     _.template(writeReviewTpl)


      initialize: (options) ->
        @options = options || {} 
        @getCategory(options)
        @model.set({'maxLength': 255})
        @handler()
        @stickit()
        
      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)
        
      getCategory: (options) ->
        $.get("/api/post/get-category/"+options.id, (data) => @setCategory(data.result))
        @$('input:text:visible:first').focus()

      setCategory:(data) ->
        @$el.empty().append(@template(_.extend({}, {'category': data.category}, {maxLength: 255}, {'types': data.types}, {'categoryId': data.categoryId})))
        @runPlugins()
        
      runPlugins: ->
        $('.rating').rating extendSymbol: (rate) ->
          $(this).tooltip
            container: 'body'
            placement: 'bottom'
            title: _.getContent(88 + rate)
        $('.review-type').multiselect({header: false, noneSelectedText: _.getContent(112), selectedText: 'выбрано # ', imageUpload: '/api/post/upload_image'})
        @$('.editor').redactor({imageUpload: '/api/post/upload_image', placeholder:  _.getContent(87)})
        $( window ).resize -> 
          if ($('.ui-multiselect-menu').is(':visible')) then $('.ui-multiselect').click()
        @addPlaceHolder()
        
      addPlaceHolder: ->
        if  @$('.redactor_editor p').html() == '<br>'
          placeholder = _.getContent(87)
          @$('.redactor_editor p').html('<span class="placeholder-redactor">' +placeholder+ '</span><br>')
        
      removePlaceholder: ->
        $('.placeholder-redactor').remove()
        
      selectExpert: ->
        $('.expert').toggleClass('active');
        if ($('.expert').hasClass('active'))
          $('#expert').val(1)
        else 
          $('#expert').val(0)
          
      confirmAction: ->
        window.confirm(_.getContent(42))

      cancelReview: (event) ->
        event.preventDefault()
        if @confirmAction() 
          if not @options.isUser 
            window.location = "/#/"
          else
            window.location = "/#/speaker/#{window.config.userId}/posts/"

      saveReview: (event) ->
        event.preventDefault()
        @hideErrors()
        @sendReviewData()

      sendReviewData: ->
        formData = $('form.review-form').serialize()
        @model.set('description': $('#description').val(), 'title': $('#title').val(), 'text': @getText(), 'reviewType': $('.review-type').val())
        if @model.isValid() then @savePostData(formData) else @showErrors(@model.validationError)

      savePostData: (formData) ->
        $.post('/api/post/saveReview', {formData}, (data) => @changeLocation(data))

      changeLocation: (data) ->
        if not @options.isUser 
          $('#js-login').trigger 'click'
        else   
          window.location = "#/review/#{data.reviewId}/"
          window.reload = true

      showErrors: (errors) ->
        _.each(errors, (error) => @showError(error))
        
      showError: (error) ->
        @$el.find('#' + error.name).closest('.di').removeClass('has-success').addClass('has-error')
        @checkPosition()

      checkPosition: ->
        topPosition = @$el.find('.has-error').offset().top
        if topPosition < $(window).scrollTop() then $("html, body").animate({scrollTop: topPosition - 20}, '500', 'swing');

      hideErrors: ->
        @$('.di').removeClass('has-error').addClass('has-success')

      showHint: (event) ->
        event.preventDefault()
        $('.write-good-story a').toggleClass('active')
        $('.write-good-story .content').toggleClass('active')
        
      getDescription: ->
        if @model.get('description')? then @model.get('description') else ''
        
      getText: ->
        if $('#text').val() != '<p><br></p>' then $('#text').val() else ''
        
      validateDescription: ->
        @model.set('description': $('#description').val())
)