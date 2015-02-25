define(
  [
    'views/LayoutView'
    'views/MainPageView'
    'views/PostsPageView'
    'views/PostPageView'
    'views/ReviewPageView'
    'views/AboutPageView'
    'views/RulesPageView'
    'views/NewPostPageView'
    'views/NewReviewPageView'
    'views/EditPostPageView'
    'views/EditReviewPageView'
    'views/SpeakersPageView'
    'views/SpeakerPageView'
    'views/RegisterPageView'
    'views/ErrorPageView'
    'views/EditSpeakerView'
    'views/TimelinePageView'
    'views/InterviewsView'
    'views/LegoInterviewView'
    'views/LegoInterviewsView'
    'models/UserRegisterModel'
    'models/UserUpdateModel'
    'models/userModel'
    'models/PostPageModel'
    'models/PostsPageModel'
    'models/SpeakersPageModel'
    'models/TimelinePageModel'
    'models/ReviewPageModel'
    'backbone'
  ]
  (
    LayoutView
    MainPageView
    PostsPageView
    PostPageView
    ReviewPageView
    AboutPageView
    RulesPageView
    NewPostPageView
    NewReviewPageView
    EditPostPageView
    EditReviewPageView
    SpeakersPageView
    SpeakerPageView
    RegisterPageView
    ErrorPageView
    EditSpeakerView
    TimelinePageView
    InterviewsView
    LegoInterviewView
    LegoInterviewsView
    UserRegisterModel
    UserUpdateModel
    userModel
    PostPageModel
    PostsPageModel
    SpeakersPageModel
    TimelinePageModel
    ReviewPageModel
  ) ->
    class Controller
      constructor: () ->

      index: ->
        $('body').removeClass().addClass('index')
        $('#js-login').removeClass()
        window.reloadMainPage = 1
        @mainPageView = new MainPageView
        LayoutView.contentRegion.$el.empty().append(@mainPageView.render().$el)
        @mainPageView.delegateEvents()
        @

      posts: (category, sort) ->
        $('body').removeClass().addClass('posts')
        $('#js-login').removeClass()
        @postsPageView = new PostsPageView({category: category, sort: sort, model: new PostsPageModel()})
        LayoutView.contentRegion.$el.empty().append(@postsPageView.render().$el)
        @postsPageView.delegateEvents()
        @

      interviews: ->
        $('body').removeClass().addClass('interviews')
        $('#js-login').removeClass()
        @legoInterviewsView = new LegoInterviewsView()
        LayoutView.contentRegion.$el.empty().append(@legoInterviewsView.$el)
        @legoInterviewsView.delegateEvents()
        @

      post: (id) ->
        $('body').removeClass().addClass('post')
        $('#js-login').removeClass()
        @postPageView = new PostPageView({id: id})
        LayoutView.contentRegion.$el.empty().append(@postPageView.$el)
        @postPageView.delegateEvents()
        @
        
      review: (id) ->
        $('body').removeClass().addClass('review')
        $('#js-login').removeClass()
        @reviewPageView = new ReviewPageView({id: id})
        LayoutView.contentRegion.$el.empty().append(@reviewPageView.$el)
        @reviewPageView.delegateEvents()
        @

      interview: (id) -> 
        $('body').removeClass().addClass('interview')
        $('#js-login').removeClass()
        @interviewView = new LegoInterviewView({id: id})
        LayoutView.contentRegion.$el.empty().append(@interviewView.$el)
        @interviewView.delegateEvents()
        @

      about: ->
        $('body').removeClass().addClass('about')
        $('#js-login').removeClass()
        @aboutPageView = new AboutPageView()
        LayoutView.contentRegion.$el.empty().append(@aboutPageView.render().$el)
        @aboutPageView.delegateEvents()
        @

      rules: ->
        $('body').removeClass().addClass('rules')
        $('#js-login').removeClass()
        @rulesPageView = new RulesPageView()
        LayoutView.contentRegion.$el.empty().append(@rulesPageView.render().$el)
        @rulesPageView.delegateEvents()
        @

      newPost: (id, isUser) ->
        if window.newPost? then delete window.newPost
        $('body').removeClass().addClass('new-post')
        $('#js-login').removeClass()
        @newPostPageView = new NewPostPageView({id: id, model: new PostPageModel(), isUser: isUser;})
        LayoutView.contentRegion.$el.empty().append(this.newPostPageView.$el)
        @newPostPageView.delegateEvents()
        @
        
      newReview: (id, isUser) ->
        if window.newPost? then delete window.newPost
        $('body').removeClass().addClass('new-review')
        $('#js-login').removeClass()
        @newReviewPageView = new NewReviewPageView({id: id,  isUser: isUser;})
        LayoutView.contentRegion.$el.empty().append(this.newReviewPageView.$el)
        @newReviewPageView.delegateEvents()
        @

      editPost: (id) ->
        $('body').removeClass().addClass('edit-post')
        $('#js-login').removeClass()
        @editPostPageView = new EditPostPageView({id: id, model: new PostPageModel()})
        LayoutView.contentRegion.$el.empty().append(this.editPostPageView.$el)
        @editPostPageView.delegateEvents()
        @
        
      editReview: (id) ->
        $('body').removeClass().addClass('edit-review')
        $('#js-login').removeClass()
        @editReviewPageView = new EditReviewPageView({id: id, model: new ReviewPageModel()})
        LayoutView.contentRegion.$el.empty().append(this.editReviewPageView.$el)
        @editReviewPageView.delegateEvents()
        @

      speakers: (category) ->
        $('body').removeClass().addClass('speakers')
        $('#js-login').removeClass()
        @speakersPageView = new SpeakersPageView({category: category, model: new SpeakersPageModel()})
        LayoutView.contentRegion.$el.empty().append(@speakersPageView.render().$el)
        @speakersPageView.delegateEvents()
        @

      register: ->
        $('body').removeClass().addClass('register')
        $('#js-login').removeClass().addClass('hidden')
        @registerPageView = new RegisterPageView({model: new UserRegisterModel()})
        LayoutView.contentRegion.$el.empty().append(@registerPageView.render().$el)
        @registerPageView.delegateEvents()
        @

      speaker: (id, page) ->
        $('body').removeClass().addClass('speaker')
        $('#js-login').removeClass()
        model = Backbone.Model.extend()
        @speakerPageView = new SpeakerPageView({id: id, page: page, model: new model()})
        LayoutView.contentRegion.$el.empty().append(@speakerPageView.render().$el)
        @speakerPageView.delegateEvents()
        @

      editSpeaker: (id) ->
        $('body').removeClass().addClass('editAuthor')
        $('#js-login').removeClass()
        @editAuthorPageView = new EditSpeakerView({model: new UserUpdateModel(), el: LayoutView.contentRegion.$el})
        @editAuthorPageView.delegateEvents()
        @

      timeline: ->
        $('body').removeClass().addClass('timeline')
        $('#js-login').removeClass()
        @timelinePageView = new TimelinePageView({model: new TimelinePageModel()})
        LayoutView.contentRegion.$el.empty().append(@timelinePageView.render().$el)
        @timelinePageView.delegateEvents()
        @

      undefinedRoute: ->
        $('body').removeClass().addClass('error')
        $('#js-login').removeClass()
        @errorPageView = new ErrorPageView()
        LayoutView.contentRegion.$el.empty().append(@errorPageView.render().$el)
        @errorPageView.delegateEvents()
        @

    return new Controller()
)