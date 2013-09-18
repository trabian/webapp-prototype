ProjectsController = require 'app/controllers/projects'

describe 'ProjectsController', ->

  describe 'index action', ->

    beforeEach ->

      @server = sinon.fakeServer.create()

      @controller = new ProjectsController

      @controller.beforeAction()

    afterEach ->
      @server.restore()

    it 'should render the projects', (done) ->

      @server.respondWith '/projects', JSON.stringify
        projects: [
          id: 1
          name: 'My Project'
        ]

      @controller.index()

      @server.respond()

      _.defer =>
        @controller.view.$el.should.contain 'My Project'
        done()
