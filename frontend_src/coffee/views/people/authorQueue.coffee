define [
         'views/base/queue'
         'JST'
         'views/people/author'
], (QueueView, JST, AuthorView) ->
  'use strict'

  class PeopleAuthorQueueView extends QueueView
    className: 'PeopleAuthorQueue'

    templateName: 'people_author_queue'

    sortable: true

    createElementView: (model) ->
      new AuthorView(model: model)