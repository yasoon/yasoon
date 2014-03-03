//Конфиг подключения скриптов requireJS
requirejs.config({

	baseUrl: 			"../frontend/api/",
	paths:{
		jquery: 			"../js/jquery-1.8.1.min",
		underscore:         "../js/underscore-min",
        backbone:           "../js/backbone-min",
        mainHtml: 			"../js/functions",
        text: 				"../js/text",
        router: 			"../api/router",
        main: 				"../api/main",
        coockie: 			"../js/cookie-js",
        uiwidget: 			"../js/jquery.ui.widget",
        iframe_transport:   "../js/jquery.fileupload",
        uploader: 			"../js/jquery.iframe-transport",
        jqueryUI: 			"../js/jquery-ui-1.10.4.custom.min",
        editor: 			"../js/redactor"       
	},

	shim: {

		uploader:{
			deps: ['uiwidget', 'iframe_transport'],
			exports: 'uploader'
		},

		editor: {
			deps: ['jquery'],
			exports: 'editor'
		},

		jqueryUI:{
			deps:['jquery'],
			exports: 'jqueryUI'
		},

		mainHtml:{
			deps: ['jquery', 'coockie', 'uploader', 'jqueryUI'],
			exports: 'mainHtml'
		},

		backbone:{
			deps: ['jquery', 'underscore', 'text'],
			exports: 'backbone'
		},


	}
});


requirejs([
    'main'
], function(app){
    
    $(window).ready(function() {
        
      app.initialize();

    });

});
