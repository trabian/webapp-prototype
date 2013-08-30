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
      coffee:
        files: ['app/scripts/**/*.coffee']
        tasks: ['coffee']

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
              mountFolder(connect, 'app')
            ]

    clean:
      server: '.tmp'

    transpile:
      cjs:
        type: 'cjs'
        files: [
          expand: true
          cwd: 'lib/'
          src: ['**/*.js']
          dest: '.tmp/js'
        ,
          expand: true
          cwd: 'lib/'
          src: ['**/*.coffee']
          dest: '.tmp/coffee'
        ]

    coffee:
      compile:
        options:
          sourceMap: true
          # bare: true
        files: [
          expand: true
          cwd: 'app'
          src: ['scripts/**/*.coffee']
          dest: '.tmp/js'
          ext: '.js'
        ]

    browserify:
      dist:
        options:
          debug: true
        files:
          'app/js/modules.js': ['.tmp/js/**/*.js']

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
  ]

  grunt.registerTask 'default', ['build']
