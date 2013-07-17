define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class PeopleAuthorView extends View
    className: 'author'

    templateName: 'people_author'