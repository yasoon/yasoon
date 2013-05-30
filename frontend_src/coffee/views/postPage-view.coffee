define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class PostPageView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'postPage'
    container: '#center'
    regions:
      '#post': 'post'
      '#newQuestion': 'newQuestion'
      '#questionsQueue': 'questionsQueue'

    templateName: 'postPage'


