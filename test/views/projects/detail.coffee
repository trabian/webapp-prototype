ProjectView = require 'app/views/projects/detail'

{ Project } = require 'app/models/project'

describe 'ProjectView', ->

  it 'should display and bind to the project name', ->

    project = new Project
      name: 'My Project'

    projectView = new ProjectView
      model: project

    projectView.$el.should.contain 'My Project'

    project.set
      name: 'My New Name'

    projectView.$el.should.contain 'My New Name'

  it 'should show the related todos', ->

    project = new Project
      name: 'My Project'
      todos: [
        id: 1
        title: 'My Todo'
      ,
        id: 2
        title: 'My Other Todo'
      ]

    projectView = new ProjectView
      model: project

    projectView.$el.should.contain 'My Todo'

    projectView.$('.todo').length.should.equal 2

  describe 'owner name', ->

    beforeEach ->
      @server = sinon.fakeServer.create()

    afterEach ->
      @server.restore()

    it 'should show the owner name', ->

      project = new Project
        name: 'My Project'
        owner:
          name: 'John Doe'

      projectView = new ProjectView
        model: project

      projectView.$el.should.contain 'John Doe'

    it 'should load and display the owner name', (done) ->

      project = new Project
        name: 'My Project'
        links:
          owner: '/people/1'

      projectView = new ProjectView
        model: project

      @server.respondWith /\/people\/(\d+)/, (req, id) ->

        req.respond 200, { "Content-Type": "application/json" }, JSON.stringify
          people: [
            id: parseInt id # Use whatever ID is passed
            name: 'Jane Doe'
          ]

      project.get('owner').fetch().done ->
        projectView.$el.should.contain 'Jane Doe'
        done()

      @server.respond()
