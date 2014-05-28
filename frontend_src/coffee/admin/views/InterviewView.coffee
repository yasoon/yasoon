define(
  [
    'text!admin/templates/interviewTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    interviewTpl
  )->
    Backbone.View.extend({
      tagName: 'article'

      className: 'interview'

      template: _.template(interviewTpl)

      render: ->
        @$el.append(@template(@model.toJSON()))
        @

    })
)
