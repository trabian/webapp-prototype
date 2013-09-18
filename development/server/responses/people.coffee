people = [
  id: 3
  name: 'Jane Doe'
]

module.exports = (server) ->

  # server.get '/people', { people }

  server.get '/people/:id', (req, params) ->

    id = parseInt params.id

    person = _.findWhere people, { id }

    req.respond

      people: [ person ]
