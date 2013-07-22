define [
        'controllers/base/controller'
        'views/people/page'
        'views/people/explore/page'
], (
  Controller,
  PeoplePageView
  PeopleExplorePageView
) ->
  'use strict'

  class PeopleController extends Controller

    #Work with questions in blank
    peopleAction: (params) ->
      if params.catId? then catId = params.catId else catId = 0
      @view = new PeoplePageView(catId: catId)

    exploreAction: (params) ->
      if not params.catId? then params.catId = 0
      @view = new PeopleExplorePageView(mode: params.mode, catId: params.catId)
