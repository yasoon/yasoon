define(
  [
    'text!admin/templates/interviewDescriptionTpl.htm'
    'backbone'
    'stickit'
  ]
(
  interviewDescriptionTpl
) ->
   class InterviewDescriptionView extends Backbone.View
    
    events: ->
      'click #js-save-description': 'saveDescription'

    template: _.template(interviewDescriptionTpl)

    initialize: (options, id) ->
        @options = options || {}
        @model = window.legoCollection.get(@options.id)

    render: ->
      @$el.html(@template(_.extend({}, {description: @model.get('interviewDescription')})))
      @

    saveDescription: (event) ->
      event.preventDefault()
      description = $('#descriptionText').val()
      $.post('api/interview/save_interview_description', {'interviewId': @model.get('id'), 'description': description}, (data) => @showText(data))
      @model.set('interviewDescription', description)

    showText: (data) ->
      if data.error is yes 
        $('.error').removeClass('has-success').addClass('has-error').html('<label>'+data.errorText+'</label>')
      else 
        $('.error').removeClass('has-error').addClass('has-success').html('<label>'+data.message+'</label>')
      setTimeout ( ->
          $('.error').removeClass('has-error').removeClass('has-success').html('')
      ), 4000

)