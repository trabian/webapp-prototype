BaseView = require 'app/views/base'

module.exports = class TodoView extends BaseView

  className: ->

    classes = ['todo', 'list-group-item']

    if @model.get 'completed'
      classes.push 'done'

    classes.join ' '

  tagName: 'li'

  template: require './template'
