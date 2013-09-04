Chaplin = require 'chaplin'

HelloController = require 'app/controllers/hello'

module.exports = class HelloView extends Chaplin.View

  getTemplateFunction: -> null

  autoRender: true

  render: ->

    super

    @$el.html @options.message

    @
