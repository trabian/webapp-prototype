Chaplin = require 'chaplin'

HelloView = require '../views/hello'

module.exports = class HelloController extends Chaplin.Controller

  show: ->

    @view = new HelloView
      message: 'Hello World!'
      el: '#main'

    console.warn 'HELLO! Check me out in Chrome to see my source map.'
