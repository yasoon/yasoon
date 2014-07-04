define(
  [
    'text!admin/templates/peoplesTpl.htm'
    'backbone'
  ]
  (
    peoplesTpl
  )->
    class peoplesList extends Backbone.View
      tagName: 'article'

      template: _.template(peoplesTpl)

      events: ->
        'click .js-export': 'export'

      render: ->
        @$el.append(@template())
        @

      export: (event) ->
        event.preventDefault()
        $.get('/admin/csv_users_email', (data) -> @showCSV(data))

      showCSV: (data) ->
        if data.error isnt undefined and data.error is 'true' then @$('textarea').val(data.result).parent().show()
)
