define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class BlogAboutPageModel extends Model
    name: 'BlogAboutPageModel'

    load: (callback) ->
      @url = -> 'api/people/get_about_info'
      @method = 'GET'
      @requestData = {}
      @request(callback)