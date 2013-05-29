define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorPosts extends Model
   url: -> "api/author/get_posts/#{@id}"