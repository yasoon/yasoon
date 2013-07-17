define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class IndexStoriesPostView extends View
    className: 'post'

    templateName: 'index_stories_post'