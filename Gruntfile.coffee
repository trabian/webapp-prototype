'use strict'

LIVERELOAD_PORT = 35740

lrSnippet = require('connect-livereload') port: LIVERELOAD_PORT

path = require 'path'

mountFolder = (connect, dir) ->
  connect.static path.resolve dir

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
        files: ['public/**/*.html']
        tasks: []
      sass_app:
        files: [
          'client/sass/app/**/*.sass'
          'client/sass/common/**/*.sass'
        ]
        tasks: ['compass:app']
      sass_lib:
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
              mountFolder(connect, 'public')
            ]

    clean:
      generated: 'public/generated'

    compass:
      options:
        importPath: [
          'client/sass/common'
        ]
        bundleExec: true
      app:
        options:
          sassDir: 'client/sass/app'
          cssDir: 'public/generated/css/app'
      lib:
        options:
          sassDir: 'client/sass/lib'
          cssDir: 'public/generated/css/lib'

    browserify:

      common:
        src: []
        dest: 'public/generated/js/common.js'
        options:
          alias: [
            'bower_components/underscore/underscore.js:underscore'
            'bower_components/backbone/backbone.js:backbone'
            'bower_components/jquery/jquery.js:jquery'
          ]

      app:
        src: ['client/app/index.coffee']
        dest: 'public/generated/js/app.js'
        options:
          debug: true
          external: ['backbone', 'underscore', 'jquery']
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

    browserify_navigation: {}

    open:
      server:
        url: 'http://localhost:<%= connect.options.port %>'

  grunt.registerTask 'server', [
    'build'
    'connect'
    'open'
    'watch'
  ]

  grunt.registerTask 'build', [
    'clean'
    'browserify_navigation'
    'browserify'
    'compass'
  ]

  grunt.registerTask 'default', ['build']
