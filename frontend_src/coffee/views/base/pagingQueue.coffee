define [
         'views/base/queue'
], (QueueView) ->
  'use strict'

  class PagingQueueView extends QueueView

    events:
      'click': (e) ->
        $target = $(e.target)

        if $target.attr('data-more-button')? then @model.load(@render)

    render: ->
      super
      if @model.full
        @$el.find("[data-more-button]").hide()