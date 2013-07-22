define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class PeopleExplorePostView extends View
    className: 'author'

    templateName: 'people_explore_post'