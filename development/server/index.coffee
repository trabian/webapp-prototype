FakeServer = require 'core/dev/lib/server'

_ = require 'underscore'

module.exports =

  run: (options = {}) ->

    _(options).defaults
      delay: 200
      responses: require './responses'

    new FakeServer options
