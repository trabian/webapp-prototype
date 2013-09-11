# _ = require 'underscore'
Chaplin = require 'chaplin'

module.exports = class BaseView extends Chaplin.View

  autoRender: true

  getTemplateFunction: -> @template

  # Passing in the @options to getTemplateData can remove a lot
  # getTemplateDate overrides.
  getTemplateData: ->
    _(super).defaults { @options }
