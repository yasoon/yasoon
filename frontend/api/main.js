define([
    'router',
    'view/header_view',
	'mainHtml',
	//Libs
    'backbone'
], function(Router,HeaderView){

    var initialize = function(){

    	window.app = window.app ? window.app : {};
    	window.config = window.config ? window.config : {};

        window.app.view = {};
        window.app.model = {};
        window.app.collection = {};
        window.config.loaderImg = {
            small: $('<img src="/frontend/img/loading.gif" class="loader" width="50" height="50" alt="Загрузка" />'),
            big:   $('<img src="/frontend/img/loader.gif" class="loader big" width="100" height="16" alt="Загрузка" />')
        };


        //Загрузка роутера
        var app_router = new Router();
        Backbone.history.start();

        $('#logout').live('click',function(e){
             e.preventDefault();
             $.post('/logout',{},function(data){
                window.app.userModel.set('userData',false);
                if( config.pageType !== 'mainPage' ) window.location = '/';
            });             
        });

        $('.page_content').on('click',function(e){
           if( $(e.target).parents('.selectBox').is('div') )
            return;

            $('.selectBox .select').slideUp(300);

        })


       /* app_router.view = new( Backbone.View.extend({
            el: window.document,
            events:{'click a':'navigateRouter'},
            navigateRouter: function(e){
                e.preventDefault();
                if( e.target.getAttribute('href') !== '#')
                 app_router.navigate(e.target.getAttribute('href'), {trigger: true});
            }            
        }))*/

        

    };

    return { initialize: initialize };

})
