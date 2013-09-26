ProjectsController = require 'app/controllers/projects'

describe 'ProjectsController', ->

  beforeEach ->

    @server = sinon.fakeServer.create()

    @controller = new ProjectsController

  afterEach ->
    @server.restore()

  describe 'index action', ->

    it 'should render the projects', (done) ->

      @controller.beforeAction {},
        action: 'index'

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

      @controller.beforeAction { id: 1 }, { action: 'show' }

      @controller.show id: 1

      view = @controller.view
      promise = view.options.promise

      view.$el.should.contain 'Loading project details...'

      view.options.promise.done ->

        view.$el.should.not.contain 'Loading project details...'

        view.$el.should.contain 'My Project'

        view.$el.should.contain 'My Todo'
        view.$el.should.contain 'My Other Todo'

        done()

      @server.respond()
