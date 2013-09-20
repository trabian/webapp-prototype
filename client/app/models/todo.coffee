{ BaseModel, BaseCollection } = require 'core/models/base'

class Todo extends BaseModel

  defaults:
    completed: false

  resourceName: 'todos'

  urlRoot: '/todos'

class TodoCollection extends BaseCollection

  model: Todo

module.exports = { Todo, TodoCollection }
