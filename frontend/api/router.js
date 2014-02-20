define([
    'view/header_view',
    'view/mainPage_view',
    'view/explorePage_view',
    'view/peoplesPage_view',
    'view/postPageView',
    'view/autorPage_view',
    'view/editProfilePageView',
    'view/message/messageView',
    'view/writepostPage_view',
    'view/editPostPage_view',    
    'view/timelinePage_view',
    'view/admin/adminPage_view',
	'backbone'
],

function(
    headerView,
    mainPageView,
    explorePageView,
    peoplesPageView,
    postPageView,
    autorPageView,
    editProfilePageView,
    messageView,
    writepostPageView,
    editPostPageView,
    timelinePageView,
    adminPage
){

	var AppRouter = Backbone.Router.extend({

		 routes: {
            // Default
            '': 'mainPage',
            'explore': 'getPosts',
            'explore/:catId/:sortType': 'getPosts',
            'peoples': 'getPeoples',
            'peoples/:catId': 'getPeoples',
            'post/:postId': 'getFullPost',
            'author/:autorId/:tabOpen': 'getAutor',
            'editprofile': 'editPage',
            'register': 'registerPage',
            'writepost': 'writepostPage',
            'editpost/:postId': 'editPostPage',            
            'timeline': 'timelinePage'
        },

        initialize: function(){      
            this.selectAutorId = false;
            this.bind('route', this.trackPageview);
            window.app.view.messageView = new messageView();
        },

         trackPageview: function ()
        {
            var url = Backbone.history.getFragment();

            //prepend slash
            if (!/^\//.test(url) && url != "")
            {
                url = "/" + url;
            }

            // Record page view
            ga('send', {
                'hitType': 'pageview',
                'page': url
            });
        },

        getPosts: function(catId,sortType){
            window.config.pageType = 'explore';
            this.renderHeader();
            this.selectAutorId = false;
            
            if( window.app.view.explore ) window.app.view.explore.render({catId: catId, sortType: sortType});
            else window.app.view.explore = new explorePageView({catId: catId, sortType: sortType});
            
        },

        mainPage: function(){
           window.config.pageType = 'mainPage';
           this.renderHeader();
           this.selectAutorId = false;
           this.clearNavClass();

           if( window.app.view.mainPage ) window.app.view.mainPage.render();
           else window.app.view.mainPage = new mainPageView();
        },

        getPeoples: function(catId){
            window.config.pageType = 'peoples';
            this.renderHeader();
            this.selectAutorId = false;

            if( window.app.view.peoples ) window.app.view.peoples.render({catId: catId});
            else window.app.view.peoples = new peoplesPageView({catId: catId});
        },

        getFullPost: function(postId){
            window.config.pageType = 'postPage';
            this.renderHeader();
            this.selectAutorId = false;
            this.clearNavClass();

            if( window.app.view.postPageView ) window.app.view.postPageView.getPost({postId: postId});
            else window.app.view.postPageView = new postPageView({postId: postId});
        },

        getAutor: function(autorId,tabOpen){
            window.config.pageType = 'autorPage';
            this.renderHeader();
            this.clearNavClass();

            if( autorId != this.selectAutorId ){
                this.selectAutorId = autorId;
                this.autorPageView = new autorPageView({'autorId': autorId, 'openTab': tabOpen});
            } else {
                if( tabOpen == 'posts' ){
                    $('.nav-tabs .postsList').show().siblings().hide();
                    $('.navigate .postsList').addClass('active').siblings().removeClass('active');
                } else {
                    $('.nav-tabs .questionsList').show().siblings().hide();
                    $('.navigate .questionsList').addClass('active').siblings().removeClass('active');
                }
            }
        },

        renderHeader: function(){
            if( window.app.view.headerView ) window.app.view.headerView.render();
            else window.app.view.headerView = new headerView();
        },

        editPage: function(){
            window.config.pageType = 'editProfile';
            this.renderHeader();
            this.selectAutorId = false;
            this.clearNavClass();

            this.editProfilePageView = new editProfilePageView({pageType: 'editProfile'});
        },

        registerPage: function(){
            window.config.pageType = 'registerPage';
            this.renderHeader();
            this.selectAutorId = false;
            this.clearNavClass();

            this.editProfilePageView = new editProfilePageView({pageType: 'register'});
        },

        writepostPage: function(){
            window.config.pageType = 'writePostPage';
            this.renderHeader();
            this.selectAutorId = false;
            this.clearNavClass();

            this.writepostPage = new writepostPageView();
        },

        editPostPage: function(postId){
            window.config.pageType = 'editPostPage';
            this.renderHeader();
            this.selectAutorId = false;
            this.clearNavClass();

            this.writepostPage = new editPostPageView({postId: postId});
        },
         timelinePage: function(){
            window.config.pageType = 'timeLinePage';
            this.renderHeader();
            this.selectAutorId = false;
            this.clearNavClass();
            
            //if( window.app.view.timelinePageView ) window.app.view.timelinePageView.render();
            this.timelinePageView = new timelinePageView();

        },

        clearNavClass: function(){
            $('header .org-nav a.active').removeClass('active');
            $('header .prof_link').attr('src','/#explore');
            $('header .people_link').attr('src','/#peoples');

        }


	})

	return AppRouter;

})