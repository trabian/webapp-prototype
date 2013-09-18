{ Project, ProjectCollection } = require 'app/models/project'

describe 'Project', ->

  beforeEach ->
    @server = sinon.fakeServer.create()

  afterEach ->
    @server.restore()

  describe 'model', ->

    it 'should be able to fetch an individual project', (done) ->

      @server.respondWith /\/projects\/(\d+)/, (req, id) ->

        req.respond 200, {}, JSON.stringify
          projects: [
            id: parseInt id # Use whatever ID is passed
            name: 'My Project'
          ]

      project = new Project
        id: 3

      project.fetch().done ->
        project.id.should.equal 3
        project.get('name').should.equal 'My Project'
        done()

      @server.respond()

  describe 'collection', ->

    it 'should be able to fetch multiple projects', (done) ->

      @server.respondWith '/projects', JSON.stringify
        projects: [
          id: 1
          name: 'My Project'
        ,
          id: 2
          name: 'My Other Project'
        ]

      projects = new ProjectCollection

      projects.fetch().done ->

        projects.at(0).get('name').should.equal 'My Project'
        projects.at(1).get('name').should.equal 'My Other Project'

        done()

      @server.respond()
