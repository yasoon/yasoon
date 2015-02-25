define(
  [
    'text!templates/editReviewTpl.htm'
    'views/ValidationView'
    'views/NewReviewPageView'
    'models/ReviewViewModel'
    'backbone'
    'stickit'
    'mediator'
    'bootstrap'
    'bootstrap-rating'
    'jqueryUi'
  ]
  (
    editReviewTpl
    ValidationView
    ReviewViewModel
  ) ->
    class EditReviewPageView extends ValidationView

      template: _.template(editReviewTpl)

      events: ->
        'click :submit':        'updateReview'
        'click .js-delete':     'deleteCheck'
        'click .expert':        'selectExpert'
#        'click .write-good-story-title':  'showHint'
        
      initialize: (options) ->
        @options = options || {}
        @model.set({'reviewId': @options.id})
        $.post("/api/post/getReview", {reviewid: @options.id}, (data) => @setCategory(data[0]))

      setCategory:(data) ->
        @model.set('reviewData', data)
        @$el.empty().append(@template(_.extend({}, @model.get('reviewData'))))
        @addRating()
        
      addRating: ->
        $('.rating').rating()
        
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
)