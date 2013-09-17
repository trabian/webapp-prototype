module.exports =

  run: ->

    server = sinon.fakeServer.create()

    console.warn 'server created'

    server.respondWith '/projects', JSON.stringify
      projects: [
        id: 1
        name: 'My Project'
      ,
        id: 2
        name: 'My Other Project'
      ]

    server.autoRespondAfter = 200
    server.autoRespond = true
