module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        'coffee': {
            app: {
                expand: true,
                flatten: false,
                cwd: 'frontend_src/coffee',
                src: ['**/{,*/}*.coffee'],
                dest: 'frontend_src/js',
                ext: '.js'
            }
        },
        'coffeelint': {
            options: {
                force: true
            },
            app: 'frontend_src/coffee/{,*/}*.coffee'
        },
        'copy': {
            js: {
                expand: true,
                flatten: false,
                cwd: 'frontend_src/coffee/',
                src: ['templates/*', 'admin/templates/*', 'vendor/*'],
                dest: 'frontend_src/js/'
            },
            css: {
                expand: true,
                flatten: false,
                cwd: 'frontend_src/less/',
                src: ['fonts/*'],
                dest: 'frontend_src/css/'
            },
            build: {
                expand: true,
                flatten: false,
                cwd: 'frontend_src/build/',
                src: ['**'],
                dest: 'frontend/'
            }
        },
        'requirejs': {
            compile: {
                options: {
                    mainConfigFile: 'frontend_src/js/config.js',
                    name: 'config',
                    out: 'frontend_src/build/js/main.min.js',
                    optimize : 'none',
                    baseUrl: 'frontend_src/js'
                }
            }
        },
        'less': {
            development: {
                options: {
                    paths: ["frontend_src/less"]
                },
                files: {
                    "frontend_src/build/css/source.css": "frontend_src/less/source.less"
                }
            }
        },
        'watch': {
            options: {
                livereload: {
                    port: 35729
                }
            },
            scripts: {
                files: ['frontend_src/coffee/{,*/}*.coffee', 'frontend_src/coffee/admin/{,*/}*.coffee', 'frontend_src/coffee/templates/*.htm', 'frontend_src/coffee/admin/templates/*.htm'],
                tasks: ['coffee:app', 'coffeelint', 'copy:js', 'requirejs', 'copy:build']
            },
            css: {
                files: ['frontend_src/less/{,*/}*.less'],
                tasks: ['less', 'copy:css', 'copy:build']
            }
        }
    });

    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-livereload');

    grunt.registerTask('default', ['watch']);
};