Chaplin = require 'chaplin'

class Todo extends Chaplin.Model

class TodoCollection extends Chaplin.Collection

  model: Todo

module.exports = { Todo, TodoCollection }
