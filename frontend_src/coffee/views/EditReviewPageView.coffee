define(
  [
    'text!templates/editReviewTpl.htm'
    'views/ValidationView'
    'views/NewReviewPageView'
    'models/ReviewViewModel'
    'backbone'
    'editor'
    'stickit'
    'mediator'
    'bootstrap'
    'bootstrap-rating'
    'jqueryUi'
    'multiselect-filter'
    'jquery-multiselect'
  ]
  (
    editReviewTpl
    ValidationView
    ReviewViewModel
  ) ->
    class EditReviewPageView extends ValidationView

      bindings:
        '#description': 'description'
        '#title': 'title'
      
      template: _.template(editReviewTpl)

      events: ->
        'click :submit':                  'updateReview'
        'click .js-delete':               'deleteCheck'
        'click .expert':                  'selectExpert'
        'click .write-good-story-title':  'showHint'
        'keyup #description':             'validateDescription'
        
      initialize: (options) ->
        @options = options || {}
        @model.set({'reviewId': @options.id})
        @model.set({'maxLength': 255})
        @handler()
        $.post("/api/post/getReview", {reviewid: @options.id}, (data) => @checkErrors(data))
        
      checkErrors: (data) ->
        if data.error == false then @setCategory(data)
        
      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)

      setCategory:(data) ->
        @model.set('reviewData', data.result[0])
        @model.set('path', data.path)
        @model.set('authorId', data.result[0]['authorId'])
        @$el.empty().append(@template(_.extend({}, @model.get('reviewData'), {maxLength: 255})))
        @runPlugins()
        
      runPlugins: ->
        $('.rating').rating extendSymbol: (rate) ->
          $(this).tooltip
            container: 'body'
            placement: 'bottom'
            title: _.getContent(88 + rate)
        $('.review-type').multiselect({header: false, noneSelectedText: _.getContent(112), selectedText: _.getContent(113), imageUpload: '/api/post/upload_image'})
        @$('.editor').redactor({imageUpload: '/api/post/upload_image'})
        $( window ).resize -> 
          if ($('.ui-multiselect-menu').is(':visible')) then $('.ui-multiselect').click()
        
      selectExpert: ->
        $('.expert').toggleClass('active');
        if ($('.expert').hasClass('active'))
          $('#expert').val(1)
        else 
          $('#expert').val(0)

      confirmAction: ->
        window.confirm(_.getContent(42))

      deleteCheck: (event) ->
        event.preventDefault()
        if @confirmAction() then @deleteReview()

      deleteReview: ->
        $.post('/api/post/deleteReview', {review_id: @options.id}, () => window.location = "/#/speaker/#{@model.get('authorId')}/posts/")

      updateReview: (event) ->
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
        window.location = "#/review/#{data.reviewId}/"
        window.reload = true
        
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