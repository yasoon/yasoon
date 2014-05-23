requirejs.config({
  baseUrl: 'assets/js',
  paths: {
    'backbone':         'vendor/backbone'
    'stickit':          'vendor/backbone.stickit'
    'epoxy':            'vendor/backbone.epoxy.min'
    'mediator':         'vendor/backbone.mediator'
    'underscore':       'vendor/lodash.underscore'
    'text':             'vendor/text'
    'jquery':           'vendor/jquery-1.11.0'
    'jqueryUi':         'vendor/jquery-ui-1.10.4.custom.min'
    'editor':           'vendor/editor'
    'fileupload':       'vendor/fileupload'
    'bootstrap':        'vendor/bootstrap.min'
  },
  shim: {
    'underscore':
      exports: '_'
    'backbone':
      deps: ['jquery', 'underscore']
    'bootstrap':
      deps: ['jquery']
  }
})

requirejs([
  'app'
],
(App) ->
)