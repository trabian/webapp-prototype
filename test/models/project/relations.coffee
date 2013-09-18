{ Project, ProjectCollection } = require 'app/models/project'
{ TodoCollection } = require 'app/models/todo'

describe 'Project relations', ->

  beforeEach ->
    @server = sinon.fakeServer.create()

  afterEach ->
    @server.restore()

  describe 'todos', ->

    it 'should expose a todos collection by default', ->

      project = new Project

      project.get('todos').should.be.an.instanceOf TodoCollection

    it 'should populate the todos collection if provided as an array attribute', ->

      project = new Project
        todos: [
          id: 1
          name: 'My Todo'
        ,
          id: 2
          name: 'My Other Todo'
        ]

      project.get('todos').should.be.an.instanceOf TodoCollection
      project.get('todos').should.have.length 2

    it 'should use the todos if provided as a TodoCollection', ->

      project = new Project
        todos: new TodoCollection [
          id: 1
          name: 'My Todo'
        ,
          id: 2
          name: 'My Other Todo'
        ,
          id: 3
          name: 'My Third Todo'
        ]

      project.get('todos').should.be.an.instanceOf TodoCollection
      project.get('todos').should.have.length 3
