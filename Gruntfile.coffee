'use strict'

path = require 'path'

# This should be unique per project to prevent conflicts when developing
# multiple apps at once.
LIVERELOAD_PORT = 35740

# Create the LiveRepload middleware that will insert a LiveReload JavaScript
# snippet at the end of any .html pages served by the connect task. This
# removes the need for a browser extension to use LiveReload.
lrSnippetMiddleware = require('connect-livereload') port: LIVERELOAD_PORT

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
              lrSnippetMiddleware
              connect.static path.resolve 'public'
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
        tasks: ['browserify:app']

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

    # Remove generated files from public/generated
    clean:
      generated: 'public/generated'

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
            'bower_components/jquery/jquery.js:jquery'
          ]

      app:
        src: ['client/app/index.coffee']
        dest: 'public/generated/js/app.js'
        options:
          debug: true
          external: ['backbone', 'underscore', 'jquery']

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
          ]

    # Use the default config for browserify_navigation, which will store the
    # browserify dependency graph in Redis to support use of Browserify
    # Navigation plugin in Sublime Text.
    browserify_navigation: {}

    # Open the web app within the default browser.
    open:
      server:
        url: 'http://localhost:<%= connect.options.port %>'

  # Run the server and watch for changes.
  grunt.registerTask 'server', [
    'build'
    'connect'
    'open'
    'watch'
  ]

  # Build the .css and .js files.
  grunt.registerTask 'build', [
    'clean'
    'browserify_navigation'
    'browserify'
    'compass'
  ]

  # Run the 'build' task by default.
  grunt.registerTask 'default', ['build']
