define [getArchiveInvestmentAccountsByPamm
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AdminStoriesPostView extends View
    className: 'storiesPost'

    templateName: 'admin_stories_post'

    events:
      'click #likeButton': ->
        @model.addLikes 1, =>
          @$el.find('#rating').html(1 + parseInt(@$el.find('#rating').html()))

      'click #assignAsDaystoryButton': (e) ->
        @model.assignAsDayStory =>
          $(e.target).html('ok')