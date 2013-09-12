{ TodoCollection } = require 'app/models/todo'

TodosView = require 'app/views/todos'

describe 'TodosView', ->

  beforeEach ->

    @collection = new TodoCollection [
      title: 'Todo 1'
    ,
      title: 'Todo 2'
    ,
      title: 'Todo 3'
    ]

    @todosView = new TodosView { @collection }

  it 'should render all items by default', ->

    @todosView.$('.todo').length.should.equal 3
    @todosView.$el.should.contain 'Todo 1'

  it 'should handle addition of new items', ->

    @collection.add
      name: 'Todo 4'

    @todosView.$('.todo').length.should.equal 4

  it 'should handle removal of items', ->

    @collection.remove @collection.first()

    @todosView.$('.todo').length.should.equal 2

  it 'should handle removal of all items', ->

    @collection.reset()

    @todosView.$('.todo').length.should.equal 0
