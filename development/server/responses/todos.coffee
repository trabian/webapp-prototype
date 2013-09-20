module.exports = (server) ->

  server.get '/todos',
    todos: [
      id: 1
      title: 'This is a sample todo'
    ,
      id: 2
      title: 'This is a completed todo'
      completed: true
    ]
