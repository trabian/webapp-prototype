'use strict'

LIVERELOAD_PORT = 35740

lrSnippet = require('connect-livereload') port: LIVERELOAD_PORT

mountFolder = (connect, dir) ->
  connect.static require('path').resolve dir

module.exports = (grunt) ->

  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig

    watch:
      options:
        livereload: LIVERELOAD_PORT
        spawn: false
      browserify:
        files: ['client/app/**/*.{coffee,jade}']
        tasks: ['browserify:app']
      html:
        files: ['build/**/*.html']
        tasks: []
      sassApp:
        files: [
          'client/sass/app/**/*.sass'
          'client/sass/common/**/*.sass'
        ]
        tasks: ['compass:app']
      sassLib:
        files: [
          'client/sass/lib/**/*.sass'
          'client/sass/common/**/*.sass'
        ]
        tasks: ['compass:lib']

    connect:
      options:
        port: 9001
        hostname: 'localhost'
      livereload:
        options:
          middleware: (connect) ->
            [
              lrSnippet
              mountFolder(connect, '.tmp') # for Sourcemap support
              mountFolder(connect, 'bower_components/fries/lib')
              mountFolder(connect, 'build')
              mountFolder(connect, '.')
            ]

    clean:
      server: '.tmp'
      js: 'build/js'
      css: 'build/css'

    concat:
      fries:
        src: 'bower_components/fries/lib/js/*.js'
        dest: '.tmp/vendor/fries.js'

    compass:
      options:
        importPath: [
          'bower_components/fries/lib/sass'
          'client/sass/common'
        ]
        bundleExec: true
      app:
        options:
          sassDir: 'client/sass/app'
          cssDir: 'build/css/app'
      lib:
        options:
          sassDir: 'client/sass/lib'
          cssDir: 'build/css/lib'

    browserify:
      common:
        src: []
        dest: 'build/js/common.js'
        options:
          alias: [
            'bower_components/underscore/underscore.js:underscore'
            'bower_components/backbone/backbone.js:backbone'
            'bower_components/jquery/jquery.js:jquery'
            '.tmp/vendor/fries.js:fries'
          ]
      app:
        src: ['client/app/index.coffee']
        dest: 'build/js/app.js'
        options:
          debug: true
          external: ['backbone', 'underscore', 'jquery', 'fries']
          alias: [
            'bower_components/chaplin/chaplin.js:chaplin'
          ]
          extensions: [
            '.js', '.coffee', '.jade'
          ]
          transform: [
            'simple-jadeify'
            'coffeeify'
          ]
          aliasMappings: [
            cwd: 'client/app'
            src: ['**/*.coffee']
            dest: 'app'
          ]

    open:
      server:
        url: 'http://localhost:<%= connect.options.port %>'

    sass:
      options:
        compass: true
        bundleExec: true
        loadPath: [
          'bower_components/fries/lib/sass'
          'client/sass/common'
        ]
      app:
        # options:
        #   sourcemap: true
        files: [
          expand: true
          cwd: 'client/sass'
          src: ['app/**/*.sass']
          dest: 'build/css'
          ext: '.css'
        ]

  grunt.registerTask 'server', [
    'build'
    'connect'
    'open'
    'watch'
  ]

  grunt.registerTask 'build', [
    'build:js'
    'compass'
  ]

  grunt.registerTask 'build:js', [
    'clean'
    'concat'
    'browserify'
  ]

  grunt.registerTask 'default', ['build']
