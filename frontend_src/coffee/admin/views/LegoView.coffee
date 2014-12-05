define(
  [
    'text!admin/templates/legoTpl.htm'
    'text!admin/templates/oneInterviewTpl.htm'
    'admin/views/LegoAnswersView'
    'backbone'
    'mediator'
  ]
  (
    legoTpl
    oneInterviewTpl
    LegoAnswersView
  )->
    class LegoView extends Backbone.View
      
      events: ->
        'change #lego-interviews': 'getInterview'
        'change #lego-questions': 'getAnswers'

      template: _.template(legoTpl)
      
      oneTemplate: _.template(oneInterviewTpl)

      render: ->
        @$el.html(@template())
        @onRender()
        @
        
      onRender: ->
        @getInterviewsList()

      getInterviewsList: ->
        $.get('api/interview/get_interviews_all', (data) => @addAll(data))
      
      addAll: (data) ->
        for index,values of data            
            @$('#lego-interviews').append(@oneTemplate(_.extend({}, {id: values.id}, {name: values.name})))
        $('#lego-interviews').change()

      getInterview: ->
        interviewId = @$('#lego-interviews').val()
        $.get('api/interview/questions/'+interviewId, (data) => @showInterviewQuestions(data))

      showInterviewQuestions: (questions) ->
        @$('#lego-questions').html('')
        for index,values of questions
            @$('#lego-questions').append(@oneTemplate(_.extend({}, {id: values.question_id}, {name: values.question})))
        $('#lego-questions').change()
        
      getAnswers: ->
        questionId = @$('#lego-questions').val()
        $.get('api/interview/get_answers/'+questionId, (data) => @showAnswers(data))

      showAnswers: (answers) ->
        if @answerview? then @close(@answerview)
        @answerview = new LegoAnswersView(answers)
        @$('#content-admin-view').append(@answerview.render().$el)
        
      close: (view) ->
        view.$el.empty()
        view.unbind()

)