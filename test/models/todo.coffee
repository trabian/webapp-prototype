{ Todo, TodoCollection } = require 'app/models/todo'

describe 'Todo', ->

  it 'should be incomplete by default', ->

    todo = new Todo

    todo.get('completed').should.be.false

describe 'TodoCollection', ->

  it 'should create Todo models', ->

    todoCollection = new TodoCollection

    todoCollection.add
      title: 'Some Title'

    todo = todoCollection.first()

    todo.should.be.an.instanceof Todo
    todo.get('completed').should.be.false
