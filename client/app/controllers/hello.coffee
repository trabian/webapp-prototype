Chaplin = require 'chaplin'

HelloView = require '../views/hello'

module.exports = class HelloController extends Chaplin.Controller

  show: ->

    @view = new HelloView
      message: 'Hello World!'
      el: '#main'

    console.warn 'HELLO! If you check me out in Chrome you can see my source map.'
