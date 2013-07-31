define [
         'views/base/queue'
], (QueueView) ->
  'use strict'

  class PagingQueueView extends QueueView
    events:
      'click': (e) ->
        $target = $(e.target)

        if $target.attr('data-more-button')? then @model.load()

    render: ->
      super
      if @model.stack.length is @model.count
        @$el.find("[data-more-button]").hide()