BaseView = require 'core/views/base'

module.exports = class ProjectView extends BaseView

  className: 'project list-group-item'

  template: require './template'

  bindings:
    '.name': 'name'
