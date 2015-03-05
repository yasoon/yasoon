define(
  [
    'text!admin/templates/adminMainPageTpl.htm'
#    'admin/views/AdminsList'
    'admin/views/PostsList'
    'admin/views/ContentsList'
    'admin/views/InterviewsList'
    'admin/views/PeoplesList'
    'admin/views/LegoView'
    'admin/views/BigImagesView'
    'admin/views/CategoriesView'
    'admin/views/EditCategoryView'
    'backbone'
    'bootstrap'
  ]
  (
    adminMainPageTpl
#    AdminsList
    PostsList
    ContentsList
    InterviewsList
    PeoplesList
    LegoView
    BigImagesView
    CategoriesView
    EditCategoryView
  ) ->
    class AdminPageView extends Backbone.View
      template: _.template(adminMainPageTpl)

      events: ->
        'click a[data-change="tab"]':     'changeTab'
        'click  #lego-start-show':        'createLegoView'
        'click  #big-images-start-show':  'createBigImagesView'
        'click  #categories-start-show':  'createCategoriesView'
        'click a.edit-category':   'editCategory'
        'click a.remove-category': 'removeCategory'
        'click a.open-category':   'openCategory'
        'click a.go-parent':   'openCategory'
        'click a.add-category':   'addCategory'
        
      setListeners: ->
        @listenTo(Backbone, 'child-click-event', @changeLocation)

      render: ->
        @$el.empty().append(@template())
#        @createAdminsList()
        @createPostsList()
        @createContentList()
        @createInterviewList()
        @createPeoplesList()
        @setListeners()
        @

#     createAdminsList: ->
#        @adminsList = new AdminsList()

      createPostsList: ->
        if not @postsList?
          @postsList = new PostsList()
        else
          @postsList.delegateEvents()
        @$('#posts').append(@postsList.$el)
        @

      createContentList: ->
        if not @contentsList?
          @contentsList = new ContentsList()
        else
          @contentsList.delegateEvents()
        @$('#content').append(@contentsList.$el)
        @

      createInterviewList: ->
        if not @interviewsList?
          @interviewsList = new InterviewsList()
        else
          @interviewsList.delegateEvents()
        @$('#interview').append(@interviewsList.$el)
        @
        
      createBigImagesView: ->
        if not @bigImagesView?
          @bigImagesView = new BigImagesView()
        else
          @bigImagesView.delegateEvents()
        @$('#bigImages').empty().append(@bigImagesView.render().$el)
        @

      createLegoView: ->
        if not @legoView?
          @legoView = new LegoView()
        else
          @legoView.delegateEvents()
        @$('#lego').empty().append(@legoView.render().$el)
        @
        
      createCategoriesView: ()->
        if not @categoriesView?
          @categoriesView = new CategoriesView({id: 0})
        else
          @categoriesView.delegateEvents()
        @$('#categories').empty().append(@categoriesView.render().$el)
        @

      createPeoplesList: ->
        if not @peoplesList?
          @peoplesList = new PeoplesList()
        else
          @peoplesList.delegateEvents()
        @$('#peoples').append(@peoplesList.render().$el)
        @

      changeTab: (event) ->
        event.preventDefault()
        self = @$(event.currentTarget)
        self.parent().addClass('active').siblings().removeClass('active')
        target = self.data('target')
        @$(target).addClass('active').siblings().removeClass('active')
        
      editCategory: (event) ->
        event.preventDefault()
        id = $(event.currentTarget).attr('data-id')
        @editCategoryView = new EditCategoryView({id: id, parent: 0})
        $('body').append(@editCategoryView.render().$el)
        @
          
      removeCategory: (event) ->
        event.preventDefault()
        id = $(event.currentTarget).attr('data-id')
        $.get("/api/post/delete-category/"+id, (data) => @changeLocation(data))
        
      openCategory: (event) ->
        event.preventDefault()
        id = $(event.currentTarget).attr('data-id')
        @categoriesView = new CategoriesView({id: id})
        @$('#categories').empty().append(@categoriesView.render().$el)
        @
        
      addCategory: (event) ->
        event.preventDefault()
        id = $(event.currentTarget).attr('data-id')
        @editCategoryView = new EditCategoryView({id: 0, parent: id})
        $('body').append(@editCategoryView.render().$el)
        @
        
      changeLocation: (data) ->
        if data.error is yes
          alert(data.errorText)
        else
          @categoriesView = new CategoriesView({id: data.id})
          $('#categories').empty().append(@categoriesView.render().$el)
        
        
      
)