# Setup globals
window.Backbone = require 'backbone'

Backbone.$ = require 'jquery'
window._ = require 'underscore'

require 'bootstrap'
require 'stickit'

# Instantiate application
Application = require './application'

new Application
  routes: require './routes'
  controllerPath: 'app/controllers/'
  controllerSuffix: ''
