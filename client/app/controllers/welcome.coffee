Chaplin = require 'chaplin'

WelcomeView = require 'app/views/welcome'

module.exports = class WelcomeController extends Chaplin.Controller

  index: ->

    @view = new WelcomeView
      message: 'Hello World!'
      el: '#main'
