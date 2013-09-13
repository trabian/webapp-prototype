BaseView = require 'app/views/base'

module.exports = class TodoView extends BaseView

  className: 'todo list-group-item'

  tagName: 'li'

  template: require './template'

  bindings:

     # :el is a special selector that binds to the main view delegate (view.$el)
    ':el':
      observe: 'completed'
      update: ($el, val) ->
        $el.toggleClass 'done', val

    '.title': 'title'

    '[type=checkbox]': 'completed'

  render: ->

    super

    @stickit()

    @
