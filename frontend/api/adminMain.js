define([
    'router',
	'mainHtml',
	//Libs
    'backbone'
], function(Router){

    var initialize = function(){

    	window.app = window.app ? window.app : {};
    	window.config = window.config ? window.config : {};

        window.app.view = {};
        window.app.model = {};
        window.app.collection = {};
        window.config.loaderImg = {
            small: $('<div class="loaderConteiner small"><div class="loaderContent"><div class="ball"></div><div class="ball1"></div></div>'),
            big:   $('<div class="loaderConteiner big"><div class="loaderContent"><div class="ball"></div><div class="ball1"></div></div>')
        };


        //Загрузка роутера
        var app_router = new Router();

        $('#logout').live('click',function(e){
             e.preventDefault();
             $.post('/logout',{},function(data){
                window.app.userModel.set('userData',false);
                if( config.pageType !== 'mainPage' ) window.location = '/';
            });             
        });

        $('.page_content').on('click',function(e){
           if( $(e.target).parents('.selectBox').is('div') ) return;
            $('.selectBox .select').slideUp(300);
        })

        window.config.getContent = function(id){
            if( config.content[id] ) return config.content[id];
            return 'Контента с id: '+id+' нет!';
        }


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
