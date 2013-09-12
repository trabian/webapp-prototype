BaseController = require './base'

{ TodoCollection } = require 'app/models/todo'

TodoListView = require 'app/views/todos'

module.exports = class TodosController extends BaseController

  index: ->

    collection = new TodoCollection [
      id: 1
      title: 'This is a sample todo'
    ,
      id: 2
      title: 'This is a completed todo'
      completed: true
    ]

    @view = new TodoListView
      collection: collection
      region: 'content'
