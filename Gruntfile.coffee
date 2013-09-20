'use strict'

path = require 'path'

# This should be unique per project to prevent conflicts when developing
# multiple apps at once.
LIVERELOAD_PORT = 35740

# Create the LiveRepload middleware that will insert a LiveReload JavaScript
# snippet at the end of any .html pages served by the connect task. This
# removes the need for a browser extension to use LiveReload.
lrSnippetMiddleware = require('connect-livereload') port: LIVERELOAD_PORT
modRewrite = require 'connect-modrewrite'

module.exports = (grunt) ->

  # Load all grunt tasks from modules beginning with grunt-*. This leverages
  # the naming convention used by almost all grunt plugins.
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig

    # Create a local server listening on port 9001. This will serve the static
    # assets as well as the livereload snippet.
    connect:
      options:
        port: 9001
        hostname: 'localhost'
      livereload:
        options:
          middleware: (connect) ->
            [
              modRewrite [
                '!\\.\\w+$ /'
              ]
              lrSnippetMiddleware
              connect.static path.resolve 'public'
              connect.static path.resolve 'bower_components'
            ]

    # Watch the specified files and run the specified tasks when any of those
    # files change.
    watch:

      options:
        livereload: LIVERELOAD_PORT
        spawn: false # This reuses the same process, speeding up task running

      # Watch all app-related .js, .coffee, and .jade files and regenerate app.js as
      # needed. If any other extensions are used, add them in the 'files'
      # expression below.
      browserify:
        files: ['client/app/**/*.{coffee,jade,js}']
        tasks: ['coffeelint:app', 'browserify:app', 'karma:unit:run']

      browserifyDevelopment:
        files: ['development/**/*.{coffee,jade,js}']
        tasks: ['coffeelint:development', 'browserify:development']

      # Trigger livereload when any .html files are changed within 'public'.
      html:
        files: ['public/**/*.html']
        tasks: []

      # Regenerate css files whenever app or common SASS files change.
      sass_app:
        files: [
          '<%= compass.app.options.sassDir %>/**/*.sass'
          'client/sass/common/**/*.sass'
        ]
        tasks: ['compass:app']

      # Regenerate css files whenever lib or common SASS files change.
      sass_lib:
        files: [
          '<%= compass.lib.options.sassDir %>/**/*.sass'
          'client/sass/common/**/*.sass'
        ]
        tasks: ['compass:lib']

      karma:
        files: ['test/**/*.coffee']
        tasks: ['coffeelint:test', 'karma:unit:run']

    bower:
      install:
        options:
          copy: false

    # Remove generated files from public/generated
    clean:
      css: 'public/generated/css'
      js: 'public/generated/js'

    # Convert .sass/.scss to .css using Compass
    compass:

      # Shared options
      options:
        importPath: [
          'client/sass/common'
        ]
        bundleExec: true

      # Styles specific to this app.
      app:
        options:
          sassDir: 'client/sass/app'
          cssDir: 'public/generated/css/app'

      # Styles integrated from other libraries such as Bootstrap. These will
      # not change as frequently as app styles and can therefore be built less
      # frequently.
      lib:
        options:
          sassDir: 'client/sass/lib'
          cssDir: 'public/generated/css/lib'
          importPath: [
            'bower_components/bootstrap-sass/lib'
          ]

    # Convert CommonJS source files to browser-ready .js files.
    browserify:

      # Libraries that need to be available to the app via CommonJS but don't
      # need to be rebuilt on a regular basis.
      lib:
        src: []
        dest: 'public/generated/js/lib.js'
        options:
          alias: [
            'bower_components/underscore/underscore.js:underscore'
            'bower_components/backbone/backbone.js:backbone'
            'bower_components/backbone.stickit/backbone.stickit.js:stickit'
            'bower_components/jquery/jquery.js:jquery'
            'bower_components/bootstrap-sass/dist/js/bootstrap.js:bootstrap'
            'bower_components/uritemplates/bin/uritemplate.js:uritemplate'
          ]

      app:
        src: ['client/app/index.coffee']
        dest: 'public/generated/js/app.js'
        options:
          debug: true
          external: ['backbone', 'underscore', 'jquery', 'bootstrap', 'stickit', 'uritemplate']

          # Chaplin needs the ability to reference modules within the app, so
          # it needs to be included in the same .js file as the app. For
          # example, the Chaplin dispatcher finds the correct controller class
          # for a route by requiring app/controllers/{controller_name}.
          alias: [
            'bower_components/chaplin/chaplin.js:chaplin'
          ]

          # Allow direct module reference to any files with the following
          # extensions. For example, this allows use of require('./template')
          # instead of require('./template.jade')
          extensions: [
            '.js', '.coffee', '.jade'
          ]

          # Transform .jade and .coffee files into their javascript equivalents.
          transform: [
            'simple-jadeify'
            'coffeeify'
          ]

          # Alias all modules within client/app to the 'app' namespace. For
          # example, require('app/controllers/hello') will reference
          # 'client/app/controllers/hello'. Without this all references within
          # the app would need to be relative.
          aliasMappings: [
            cwd: 'client/app'
            src: ['**/*.{coffee,js,jade}']
            dest: 'app'
            rename: (src, dest) ->

              # Rename index.coffee files so they can be referenced externally
              # without the index.coffee. For example, app/views/hello/index
              # will be exposed as app/views/hello.
              dest = dest.replace /\/index\.(\w*)$/, '.$1'
              "app/#{dest}"
          ,
            cwd: 'submodules/trabian-webapp-core/app'
            src: ['**/*.{coffee,js,jade}']
            dest: 'core'
            rename: (src, dest) ->

              # Rename index.coffee files so they can be referenced externally
              # without the index.coffee. For example, app/views/hello/index
              # will be exposed as app/views/hello.
              dest = dest.replace /\/index\.(\w*)$/, '.$1'
              "core/#{dest}"
          ]

      development:
        src: ['development/index.coffee']
        dest: 'public/generated/js/development.js'
        options:
          debug: true

          extensions: [
            '.js', '.coffee'
          ]

          transform: [
            'coffeeify'
          ]

          external: ['underscore']

          aliasMappings: [
            cwd: 'development'
            src: ['**/*.{coffee,js,jade}']
            dest: 'dev'
            rename: (src, dest) ->

              # Rename index.coffee files so they can be referenced externally
              # without the index.coffee. For example, app/views/hello/index
              # will be exposed as app/views/hello.
              dest = dest.replace /\/index\.(\w*)$/, '.$1'
              "dev/#{dest}"
          ,
            cwd: 'submodules/trabian-webapp-core/development'
            src: ['**/*.{coffee,js,jade}']
            dest: 'core/dev'
            rename: (src, dest) ->

              # Rename index.coffee files so they can be referenced externally
              # without the index.coffee. For example, app/views/hello/index
              # will be exposed as app/views/hello.
              dest = dest.replace /\/index\.(\w*)$/, '.$1'
              "core/dev/#{dest}"
          ]

    # Use the default config for browserify_navigation, which will store the
    # browserify dependency graph in Redis to support use of Browserify
    # Navigation plugin in Sublime Text.
    browserify_navigation: {}

    coffeelint:
      app: ['client/app/**/*.coffee']
      development: ['development/**/*.coffee']
      test:
        files:
          src: [
            'test/**/*.coffee'
          ]
        options:
          max_line_length:
            level: 'ignore'

    # Open the web app within the default browser.
    open:
      server:
        url: 'http://localhost:<%= connect.options.port %>'

    karma:
      options:
        frameworks: ['mocha', 'chai', 'chai-jquery', 'sinon-chai']
        preprocessors:
          'test/**/*.coffee': ['coffee']
        reporters: ['spec', 'osx']
        autoWatch: false
        browsers: ['PhantomJS']
        coffeePreprocessor:
          options:
            bare: true
            sourceMap: false
        files: [
          'public/generated/js/lib.js'
          'public/generated/js/app.js'
          'test/**/*.coffee'
        ]
      unit:
        background: true
        singleRun: false
      single:
        singleRun: true

  # Run the server and watch for changes.
  grunt.registerTask 'server', [
    'build'
    'connect'
    'open'
    'karma:unit'
    'watch'
  ]

  # Build the .css and .js files.
  grunt.registerTask 'build', [
    'clean:css'
    'build:js'
    'compass'
  ]

  grunt.registerTask 'build:js', [
    'bower:install'
    'clean:js'
    'coffeelint'
    'browserify_navigation'
    'browserify'
  ]

  grunt.registerTask 'test', [
    'build:js'
    'karma:single'
  ]

  grunt.registerTask 'test:watch', [
    'karma:unit'
    'watch'
  ]

  # Run the 'server' task by default.
  grunt.registerTask 'default', ['server']
