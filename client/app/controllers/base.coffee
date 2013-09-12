Chaplin = require 'chaplin'

Site = require 'app/views/site'

module.exports = class BaseController extends Chaplin.Controller

  beforeAction: ->
    @compose 'site', Site
