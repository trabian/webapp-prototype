Chaplin = require 'chaplin'

HelloView = require 'app/views/hello/index'

module.exports = class HelloController extends Chaplin.View

  show: ->

    @view = new HelloView
      message: 'Hello World!'
      el: '#main'

    console.warn 'HELLO!'
