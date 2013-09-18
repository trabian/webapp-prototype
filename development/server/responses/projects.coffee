projects = [
  id: 1
  name: 'My Project'
  todos: [
    id: 1
    title: 'My Todo'
  ]
,
  id: 2
  name: 'My Other Project'
]

module.exports = (server) ->

  server.get '/projects', { projects }

  server.get '/projects/:id', (req, params) ->

    id = parseInt params.id

    project = _.findWhere projects, { id }

    req.respond
      projects: [ project ]
