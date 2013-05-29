define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorInfo extends Model
   url: -> "api/author/get_short_info/#{@id}"