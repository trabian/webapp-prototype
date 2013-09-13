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

  describe 'changes to the model', ->

    beforeEach ->

      @todo = new Todo
        title: 'A Title'
        completed: false

      @todoView = new TodoView
        model: @todo

    it 'should update the title when the title attribute changes', ->

      @todoView.$el.should.contain 'A Title'

      @todo.set
        title: 'A New Title'

      @todoView.$el.should.contain 'A New Title'

    describe 'changes to the "completed" attribute', ->

      it 'should update the checkbox', ->

        @todoView.$('[type=checkbox]').should.not.be.checked

        @todo.set
          completed: true

        @todoView.$('[type=checkbox]').should.be.checked

        @todo.set
          completed: false

        @todoView.$('[type=checkbox]').should.not.be.checked

      it 'should update the "done" class', ->

        @todoView.$el.should.not.have.class 'done'

        @todo.set
          completed: true

        @todoView.$el.should.have.class 'done'

        @todo.set
          completed: false

        @todoView.$el.should.not.have.class 'done'

  describe 'changes to the view', ->

    beforeEach ->

      @todo = new Todo
        title: 'A Title'
        completed: false

      @todoView = new TodoView
        model: @todo

    it 'should update the "completed" attribute when the checkbox is updated', ->

      $checkbox = @todoView.$ '[type=checkbox]'

      @todo.get('completed').should.be.false

      $checkbox.prop(checked: true).trigger 'change'

      @todo.get('completed').should.be.true

      $checkbox.prop(checked: false).trigger 'change'

      @todo.get('completed').should.be.false
