TodoView = require 'app/views/todos/todo'

{ Todo } = require 'app/models/todo'

describe 'TodoView', ->

  it 'should render the todo title', ->

    todo = new Todo
      title: 'A New Todo'

    todoView = new TodoView
      model: todo

    todoView.$el.should.contain 'A New Todo'

  describe 'completion status', ->

    it 'the checkbox should be checked and the element .done if the todo is completed', ->

      todo = new Todo
        title: 'A Title'
        completed: true

      todoView = new TodoView
        model: todo

      todoView.$('[type=checkbox]').should.be.checked
      todoView.$el.should.have.class 'done'

    it 'should not be checked and the element should not be .done if the todo is not completed', ->

      todo = new Todo
        title: 'A Title'
        completed: false

      todoView = new TodoView
        model: todo

      todoView.$('[type=checkbox]').should.not.be.checked
      todoView.$el.should.not.have.class 'done'
