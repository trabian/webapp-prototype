Chaplin = require 'chaplin'

HelloView = require 'app/views/hello'

module.exports = class HelloController extends Chaplin.View

  show: ->

    @view = new HelloView
      message: 'Hello World!'
      el: 'h1'
