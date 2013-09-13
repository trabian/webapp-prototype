BaseView = require 'app/views/base'

module.exports = class TodoView extends BaseView

  className: 'todo list-group-item'

  tagName: 'li'

  template: require './template'

  initialize: ->

    super

    @listenTo @model, 'change', @render

  render: ->

    super

    @$el.toggleClass 'done', @model.get 'completed'

    @
