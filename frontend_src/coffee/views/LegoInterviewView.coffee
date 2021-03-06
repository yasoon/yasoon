define(
  [
    'text!templates/legoInterviewsTpl.htm'
    'text!templates/legoInterviewsModeratorsTpl.htm'
    'backbone'
    'stickit'
    'bootstrap'
  ]
  (
    legoInterviewsTpl
    legoInterviewsModeratorsTpl
    
  ) ->
    class LegoInterviewView extends Backbone.View
      events: ->
        'click .js-open':   'openQuestion'
        'click .like-this': 'addLike'

      tagName: 'section'

      template: _.template(legoInterviewsTpl)
      ModerTemplate: _.template(legoInterviewsModeratorsTpl)

      initialize: (options) ->
        @checkSocial(options)
        

      checkErrors: (data) ->
        if data.error is yes then @showError(data) else @setInterviewData(data.interviewData)

      setInterviewData: (data) ->
        if (data.questions).length == 0
            data.errorText = 'Нет ответов на данное интервью'
            @showError(data)
        else
            @$el.empty().append(@template(_.extend({}, {'questions': data.questions}, {'title': data.interviewTitle}, {'id': data.interviewId}, {'image': data.previewImg}, {'description': data.interviewDescription})))
            $.get("/api/interview/get_moderators/" + data.interviewId, {}, (data) => @addModerators(data))

      showError: (data) ->
        @$el.empty().append('<div class="content">'+data.errorText+'</div>')
        
      addLike: (event) ->
        event.preventDefault()
        clickElement = $(event.target)
        postId = clickElement.closest('.like-title-interview').attr('data-postid')
        $.post('/api/post/add_likes', {'postlike': @likeData(postId)}, (data) => @changeLikeCount(data))

      likeData: (id) ->
        _.extend({}, {postId: id, type: 'add'})

      changeLikeCount: (data) ->
        if not data.error and data.count then @$el.find("[data-postid='" + data.postId + "']").find('.like-this .counter').text(data.count)
        
      checkSocial: (options) ->
        if typeof(FB) != 'undefined'
          location.reload(false)
        else
          $.get("/api/interview/get_interviews_lego/" + options.id, {}, (data) => @checkErrors(data))

      openQuestion: (event) ->
        event.preventDefault()
        $this = $(event.currentTarget)
        if not $this.hasClass('active')
          $this.addClass('active')
        else 
          $this.removeClass('active')
          $this.removeClass('question-fix')
        $this.next().slideToggle()
        
        if $this.hasClass('active')
          $('html, body').animate({
              scrollTop: $this.offset().top
          }, 1000);

      addModerators: (data) ->
        if data.error is no and data.result.length then $('.moderators').empty().append(@ModerTemplate(_.extend({}, {'moderators': data.result})))
)
