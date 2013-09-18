BaseView = require 'core/views/base'

TodosView = require 'app/views/todos'

module.exports = class ProjectView extends BaseView

  template: require './template'

  bindings:
    '.name': 'name'

  render: ->

    super

    @subview 'todos', new TodosView
      collection: @model.get 'todos'
      el: @$ '.todos'

    @
