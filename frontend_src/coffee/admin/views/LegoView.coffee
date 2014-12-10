define(
  [
    'text!admin/templates/legoTpl.htm'
    'text!admin/templates/oneInterviewTpl.htm'
    'text!admin/templates/imgTpl.htm'
    'admin/views/LegoAnswersView'
    'admin/collections/LegoCollection'
    'backbone'
    'mediator'
  ]
  (
    legoTpl
    oneInterviewTpl
    imageTpl
    LegoAnswersView
    LegoCollection
  )->
    class LegoView extends Backbone.View
      
      initialize: ->
        window.legoCollection = new LegoCollection()

      events: ->
        'change #lego-interviews': 'getInterview'
        'change #lego-questions': 'getAnswers'

      template: _.template(legoTpl)
      
      oneTemplate: _.template(oneInterviewTpl)

      imgTemplate: _.template(imageTpl)

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
            window.legoCollection.add({'id': values.id, 'interviewImg': values.interviewImg})
        $('#lego-interviews').change()

      getInterview: ->
        interviewId = @$('#lego-interviews').val()
        $.get('api/interview/questions/'+interviewId, (data) => @showInterviewQuestions(data))
        modelLego = window.legoCollection.get(interviewId)
        @$('.file_upload_block').empty().append(@imgTemplate(_.extend({}, {id: modelLego.get('id')}, {interviewImg: modelLego.get('interviewImg')})))
        @setImageUploader(modelLego, interviewId)
        
        

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

      setImageUploader: (modelLego, interviewId) ->
        new AjaxUpload(
            @$('#uploadImg')[0],
            action: '/api/interview/upload_interview_image/'+interviewId
            name: 'files[]'
            id: interviewId
            createInput: ->
            onComplete: (file, data) ->
              ret = JSON.parse(data)
              modelLego.set('interviewImg', ret.file_name)
              #hotfix @toDo listener not call change img
              $('.file_upload_block, header').find('img').attr('src', "/web/upload/interviews/#{ret.file_name}")
        )

)