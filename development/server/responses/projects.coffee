module.exports = (server) ->

  server.get '/projects',
    projects: [
      id: 1
      name: 'My Project'
    ,
      id: 2
      name: 'My Other Project'
    ]
