BaseController = require './base'

WelcomeView = require 'app/views/welcome'

module.exports = class WelcomeController extends BaseController

  index: ->

    @view = new WelcomeView
      message: 'Hello World!'
      region: 'content'
