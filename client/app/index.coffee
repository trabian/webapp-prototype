# Setup globals
Backbone = require 'backbone'

Backbone.$ = require 'jquery'
window._ = require 'underscore'

require 'bootstrap'

# Instantiate application
Application = require './application'

new Application
  routes: require './routes'
  controllerPath: 'app/controllers/'
  controllerSuffix: ''
