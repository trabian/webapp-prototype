ProjectsController = require 'app/controllers/projects'

describe 'ProjectsController', ->

  beforeEach ->

    @server = sinon.fakeServer.create()

    @controller = new ProjectsController

    @controller.beforeAction()

  afterEach ->
    @server.restore()

  describe 'index action', ->

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

  describe 'show action', ->

    it 'should render an individual project', (done) ->

      @server.respondWith '/projects/1', JSON.stringify
        projects: [
          id: 1
          name: 'My Project'
          todos: [
            id: 1
            title: 'My Todo'
          ,
            id: 2
            title: 'My Other Todo'
          ]
        ]

      @controller.show id: 1

      @server.respond()

      _.defer =>

        @controller.view.$el.should.contain 'My Project'

        @controller.view.$el.should.contain 'My Todo'
        @controller.view.$el.should.contain 'My Other Todo'

        done()
