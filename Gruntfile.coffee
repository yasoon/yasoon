module.exports = (grunt) ->
  _ = require('lodash');
  grunt.loadNpmTasks('grunt-handlebars-compiler');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.initConfig(
    handlebars:
      all:
        files:
           'frontend_src/js/templates_compiled/combined.js': 'frontend_src/templates/**/*.hbs'
        options:
          exportCommonJS: 'handlebars'
          namespace: 'JST'
          AMD: true
          processFilename: (filePath) ->
            pathElems = filePath.replace('frontend_src/templates/', '').split('/')
            filenameExt = _.last(pathElems).split('.')
            name = _(pathElems).without(_.last(pathElems)).concat(_(filenameExt).without(_.last(filenameExt))).join('_')
            return name
    coffee:
      glob_to_multiple:
        expand: true

    watch:
      handlebars:
        files: 'frontend_src/templates/**/*.hbs'
        tasks:  'handlebars'
  )
