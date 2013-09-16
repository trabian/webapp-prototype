BaseView = require 'core/views/base'

module.exports = class HeaderView extends BaseView

  template: require './template'

  region: 'header'

  render: ->

    super

    if tab = @options.tab
      @$("ul.nav > li.#{tab}").addClass 'active'

    @
