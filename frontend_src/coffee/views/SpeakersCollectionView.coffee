define(
  [
    'text!templates/speakersStoriesTpl.htm'
    'views/SpeakerPreview'
    'views/PaginationView'
    'backbone'
  ]
(
  speakersStoriesTpl
  SpeakerPreview
  PaginationView
) ->
  class SpeakerCollectionView extends PaginationView
    tagName: 'section'
    
    template: _.template(speakersStoriesTpl)
      
    render: ->
      @data = _.extend(@options, @options.description)
      super

    updateCounter: (event) ->
      @updateCollection()
      super

    updateCollection: () ->
      counter = @counter + 1
      category = @options.category
      $.get("/api/post/get_categoryPeople/#{category}/#{counter}/10",
      (data) =>
        data = data['peoples']
        @collection.add(data)
      ,'json')

    addOne: (item) ->
      item = new SpeakerPreview({model: item})
      @itemsList.append(item.render().$el)

)