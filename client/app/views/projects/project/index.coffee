BaseView = require 'core/views/base'

module.exports = class ProjectView extends BaseView

  className: 'project'

  template: require './template'

  bindings:
    '.name': 'name'
