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
        
      className:                    'page-layout m-page'
      tagName:                      'section'

      template:                     _.template(writeReviewTpl)

      initialize: (options) ->
        @options = options || {} 
        @getCategory(options)

      getCategory: (options) ->
        $.get("/api/post/get-category/"+options.id, (data) => @setCategory(data.result))
        @$('input:text:visible:first').focus()

      setCategory:(data) ->
        @$el.empty().append(@template(_.extend({}, {'category': data.category}, {'types': data.types}, {'categoryId': data.categoryId})))
        @runPlugins()
        
      runPlugins: ->
        $('.rating').rating()
        $('.review-type').multiselect({header: false, noneSelectedText: 'выбрать тип', selectedText: 'выбрано # ', imageUpload: '/api/post/upload_image'})
        @$('.editor').redactor({imageUpload: '/api/post/upload_image'})
        
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
)