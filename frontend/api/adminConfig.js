//Конфиг подключения скриптов requireJS
requirejs.config({

	baseUrl: 			"../frontend/api/",
	paths:{
		jquery: 			"../js/jquery-1.8.1.min",
		underscore:         "../js/underscore-min",
        backbone:           "../js/backbone-min",
        mainHtml: 			"../js/functions",
        text: 				"../js/text",
        router: 			"../api/adminRouter",
        adminMain: 			"../api/adminMain",
        coockie: 			"../js/cookie-js",
        uiwidget: 			"../js/jquery.ui.widget",
        iframe_transport:   "../js/jquery.fileupload",
        uploader: 			"../js/jquery.iframe-transport" 
       
	},
	shim: {

		uploader:{
			deps: ['uiwidget', 'iframe_transport'],
			exports: 'uploader'
		},

		mainHtml:{
			deps: ['jquery', 'coockie', 'uploader'],
			exports: 'mainHtml'
		},

		backbone:{
			deps: ['jquery', 'underscore', 'text'],
			exports: 'backbone'
		}
	}
});


requirejs([
    'adminMain'
], function(app){
    
    $(window).ready(function() {
        
      app.initialize();

    });

});
