module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        'coffee': {
        	app: {
				expand: true,
				flatten: false,
				cwd: 'assets/coffee',
				src: ['**/*.coffee'],
				dest: 'assets/js',
				ext: '.js'
        	}
        },
		'coffeelint': {
			options: {
				force: true
			},
			app: 'assets/coffee/{,*/}*.coffee'
		},
        'copy': {
        	js: {
        		expand: true,
        		flatten: false,
        		cwd: 'assets/coffee/',
        		src: ['templates/*', 'vendor/*'],
        		dest: 'assets/js/'
        	},
        	css: {
        		expand: true,
        		flatten: false,
        		cwd: 'assets/less/',
        		src: ['fonts/*'],
        		dest: 'assets/css/'
        	}
        },
		'requirejs': {
			compile: {
				options: {
		            mainConfigFile: 'assets/js/config.js',
		            name: 'config',
		            out: 'assets/build/js/main.min.js',
		            optimize : 'none',
		            baseUrl: 'assets/js',
				}
			}
		},
        'less': {
			development: {
				options: {
					paths: ["assets/less"]
				},
				files: {
					"assets/build/css/source/source.css": "assets/less/source.less"
				}
			}
        },
		'ftp-deploy': {
			js: {
				auth: {
					host: 'yasoon.mnb-t.com',
					port: 21,
					authKey: 'yasoon'
				},
				src: 'assets/build/js',
				dest: '/frontend/js',
			},
			css: {
				auth: {
					host: 'yasoon.mnb-t.com',
					port: 21,
					authKey: 'yasoon'
				},
				src: 'assets/build/css/source',
				dest: '/frontend/css',
			},
			all: {
				auth: {
					host: 'yasoon.mnb-t.com',
					port: 21,
					authKey: 'yasoon'
				},
				src: 'assets/build/',
				dest: '/frontend/',
			}
		},
        'watch': {
            options: {
                livereload: {
                    port: 35729,
                },
            },
            scripts: {
                files: ['assets/coffee/{,*/}*.coffee', 'assets/coffee/{,*/}*.htm'],
                tasks: ['coffee:app', 'coffeelint', 'copy:js', 'requirejs', 'ftp-deploy:js']
            },
            css: {
                files: ['assets/less/{,*/}*.less'],
                tasks: ['less', 'copy:css', 'ftp-deploy:css']
            },
        },
    });

    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-ftp-deploy');
    grunt.loadNpmTasks('grunt-contrib-less');
	grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-livereload');

    grunt.registerTask('default', ['watch']);
};