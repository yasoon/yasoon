define(
  [
    'text!admin/templates/legoAnswersTpl.htm'
    'text!admin/templates/legoAnswerTpl.htm'
    'backbone'
    'stickit'
  ]
(
  legoAnswersTpl
  legoAnswerTpl
) ->
   class LegoAnswersView extends Backbone.View
    
    events: ->
      'click #js-save-lego': 'saveLego'
      'click #js-delete-lego': 'deleteLego'

    template: _.template(legoAnswersTpl)
    
    answerTemplate: _.template(legoAnswerTpl)

    initialize: (options, id) ->
        @options = options || {}
        @idForInterview = $('#lego-interviews').val()
        @idForQuestion = $('#lego-questions').val()

    render: ->
      @$el.html(@template(_.extend({}, {id: @idForInterview})))
      @onRender()
      @

    onRender: ->
      @$('#js-save').show()
      if @options.length == 0
        @$('#lego-answers-content').html('Нет ответов на данный вопрос')
        @$('#js-save').hide()
      else
        for index,values of @options
            if values.answer? 
                @$('#lego-answers-content').append(@answerTemplate(_.extend({}, {id: values.id}, {text: values.answer}, {lego: values.lego})))

    saveLego: ->
      data = []
      $('.checkbox-lego-answer:checked').each((iterator, item) => data[iterator] = $(item).val())
      if data.length != 0
        $.post('api/interview/save_interview_lego', {'interviewId': @idForInterview, 'questionId': @idForQuestion, 'answers': data}, (data) => @showText(data))
      else
        @showText({'error': true, 'errorText': 'Нет выбранных ответов'})
      
    showText: (data) ->
      if data.error is yes 
        $('.error').removeClass('has-success').addClass('has-error').html('<label>'+data.errorText+'</label>')
      else 
        $('.error').removeClass('has-error').addClass('has-success').html('<label>'+data.message+'</label>')
      setTimeout ( ->
          $('.error').removeClass('has-error').removeClass('has-success').html('')
      ), 4000

    deleteLego: ->
      data = []
      $('.checkbox-lego-answer:checked').each((iterator, item) => data[iterator] = $(item).val())
      if data.length != 0
        $.post('api/interview/remove_interview_lego', {'interviewId': @idForInterview, 'questionId': @idForQuestion}, (data) => 
            @showText(data)
            @unCheckAll(data)
        )
      else
        @showText({'error': true, 'errorText': 'Нет выбранных ответов'})

    unCheckAll: (data) ->
      if data.error is no then $('.checkbox-lego-answer:checked').each((iterator, item) => $(item).prop('checked', false))
)