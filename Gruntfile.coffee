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
      coffee:
        files: ['client/app/**/*.coffee']
        tasks: ['coffee', 'browserify:app']
      html:
        files: ['app/**/*.html']
        tasks: []
      sass:
        files: ['client/sass/**/*.sass']
        tasks: ['compass']

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
            ]

    clean:
      server: '.tmp'

    concat:
      fries:
        src: 'bower_components/fries/lib/js/*.js'
        dest: '.tmp/vendor/fries.js'

    coffee:
      compile:
        options:
          sourceMap: true
          bare: true
        files: [
          expand: true
          cwd: 'client/app'
          src: ['**/*.coffee']
          dest: '.tmp/js'
          ext: '.js'
        ]

    compass:
      dev:
        options:
          sassDir: 'client/sass'
          cssDir: 'build/css'
          importPath: 'bower_components/fries/lib/sass'

    browserify:
      common:
        src: []
        dest: 'build/js/common.js'
        options:
          alias: [
            'bower_components/underscore/underscore.js:underscore'
            'bower_components/backbone/backbone.js:backbone'
            'bower_components/chaplin/chaplin.js:chaplin'
            'bower_components/jquery/jquery.js:jquery'
            '.tmp/vendor/fries.js:fries'
          ]
      app:
        options:
          debug: true
          external: ['backbone', 'underscore', 'chaplin', 'jquery', 'fries']
        files:
          'build/js/modules.js': ['.tmp/js/**/*.js']

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
    'coffee'
    'concat'
    'browserify'
  ]

  grunt.registerTask 'default', ['build']
