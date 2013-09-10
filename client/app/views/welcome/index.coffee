Chaplin = require 'chaplin'

module.exports = class WelcomeView extends Chaplin.View

  template: require './template'

  getTemplateFunction: -> @template

  getTemplateData: ->
    message: @options.message

  autoRender: true
