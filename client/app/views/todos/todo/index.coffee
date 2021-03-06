BaseView = require 'core/views/base'

module.exports = class TodoView extends BaseView

  bindings:

     # :el is a special selector that binds to the main view delegate (view.$el)
    ':el':
      observe: 'completed'
      update: ($el, val) ->
        $el.toggleClass 'done', val

    '.title': 'title'

    '[type=checkbox]': 'completed'

  className: 'todo list-group-item'

  tagName: 'li'

  template: require './template'
