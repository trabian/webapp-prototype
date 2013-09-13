BaseView = require 'app/views/base'

module.exports = class TodoView extends BaseView

  className: 'todo list-group-item'

  tagName: 'li'

  template: require './template'

  initialize: ->

    super

    @listenTo @model, 'change:title', ->
      @$('.title').text @model.get 'title'

    @listenTo @model, 'change:completed', ->

      @$('[type=checkbox]').prop
        checked: @model.get 'completed'

      @$el.toggleClass 'done', @model.get 'completed'

  render: ->

    super

    @$el.toggleClass 'done', @model.get 'completed'

    @
