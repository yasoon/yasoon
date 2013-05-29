module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-handlebars-compiler');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.initConfig(
    handlebars:
      all:
        files:
           'frontend_src/js/templates_compiled/combined.js': 'frontend_src/templates/*.hbs'
        options:
          exportCommonJS: 'handlebars'
          namespace: 'JST'
          AMD: true
    coffee:
      glob_to_multiple:
        expand: true

    watch:
      handlebars:
        files: 'frontend_src/templates/*.hbs'
        tasks:  'handlebars'
  )
