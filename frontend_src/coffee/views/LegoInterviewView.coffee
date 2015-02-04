define(
  [
    'text!templates/legoInterviewsTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    legoInterviewsTpl
    
  ) ->
    class LegoInterviewView extends Backbone.View
      events: ->
        'click .js-open':   'openQuestion'

      tagName: 'section'

      template: _.template(legoInterviewsTpl)

      initialize: (options) ->
        $.get("/api/interview/get_interviews_lego/" + options.id, {}, (data) => @checkErrors(data))

      checkErrors: (data) ->
        if data.error is yes then @showError(data) else @setInterviewData(data.interviewData)

      setInterviewData: (data) ->
        if (data.questions).length == 0
            data.errorText = 'Нет ответов на данное интервью'
            @showError(data)
        else
            @$el.empty().append(@template(_.extend({}, {'questions': data.questions}, {'title': data.interviewTitle}, {'id': data.interviewId}, {'image': data.previewImg}, {'description': data.interviewDescription})))

      showError: (data) ->
        @$el.empty().append('<div class="content">'+data.errorText+'</div>')

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
          
          topPos = $this.offset().top;
          $(window).on 'scroll':->
            top = $(document).scrollTop() + 50
            pip = $this.parent().next().offset().top
            height = $this.outerHeight()
            if (top > topPos && top < pip - height) then $this.addClass('question-fix').removeAttr("style") 
            else if (top > pip - height) then $this.removeClass('question-fix')
            else $this.removeClass('question-fix')
        
)
