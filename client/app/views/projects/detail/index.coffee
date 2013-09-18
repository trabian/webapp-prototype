BaseView = require 'core/views/base'

TodosView = require 'app/views/todos'

module.exports = class ProjectView extends BaseView

  template: require './template'

  bindings:
    '.name': 'name'

  ownerBindings:
    '.owner-name': 'name'

  render: ->

    super

    @subview 'todos', new TodosView
      collection: @model.get 'todos'
      el: @$ '.todos'

    @listenToAndTrigger @model, 'change:owner', ->

      if previousOwner = @model.previous 'owner'
        @unstickit previousOwner

      if owner = @model.get 'owner'

        @stickit owner, @ownerBindings

    @
