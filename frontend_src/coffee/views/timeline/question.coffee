define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class TimelineQuestionView extends View
    className: 'element'

    templateName: 'timeline_question'