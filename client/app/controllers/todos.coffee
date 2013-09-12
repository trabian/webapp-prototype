BaseController = require './base'

{ TodoCollection } = require 'app/models/todo'

TodoListView = require 'app/views/todos'

module.exports = class TodosController extends BaseController

  index: ->

    collection = new TodoCollection [
      id: 1
      name: 'This is a sample todo'
    ,
      id: 2
      name: 'This is another todo'
    ]

    @view = new TodoListView
      collection: collection
      region: 'content'
