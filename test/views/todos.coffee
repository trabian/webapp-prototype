{ TodoCollection } = require 'app/models/todo'

TodosView = require 'app/views/todos'

describe 'TodosView', ->

  beforeEach ->

    @collection = new TodoCollection [
      name: 'Todo 1'
    ,
      name: 'Todo 2'
    ,
      name: 'Todo 3'
    ]

    @todosView = new TodosView { @collection }

  it 'should render all items by default', ->

    @todosView.$('.todo').length.should.equal 3

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
