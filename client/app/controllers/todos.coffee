BaseController = require './base'

{ TodoCollection } = require 'app/models/todo'

TodoListView = require 'app/views/todos'

module.exports = class TodosController extends BaseController

  tab: 'todos'

  index: ->

    collection = new TodoCollection

    collection.fetch()

    @view = new TodoListView
      collection: collection
      region: 'content'
