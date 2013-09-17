FakeServer = require 'core/dev/lib/server'

module.exports =

  run: ->

    new FakeServer
      responses: require './responses'
      delay: 200
