BaseView = require 'app/views/base'

module.exports = class TodoView extends BaseView

  className: 'todo'

  template: require './template'
