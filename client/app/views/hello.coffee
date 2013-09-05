Chaplin = require 'chaplin'

module.exports = class HelloView extends Chaplin.View

  template: require './template'

  getTemplateFunction: -> @template

  getTemplateData: ->
    message: @options.message

  autoRender: true
