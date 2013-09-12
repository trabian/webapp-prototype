TodoView = require 'app/views/todos/todo'

{ Todo } = require 'app/models/todo'

describe 'TodoView', ->

  it 'should render the todo title', ->

    todo = new Todo
      title: 'A New Todo'

    todoView = new TodoView
      model: todo

    todoView.$el.should.contain 'A New Todo'
