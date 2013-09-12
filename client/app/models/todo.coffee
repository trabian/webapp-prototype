Chaplin = require 'chaplin'

class Todo extends Chaplin.Model

  defaults:
    completed: false

class TodoCollection extends Chaplin.Collection

  model: Todo

module.exports = { Todo, TodoCollection }
