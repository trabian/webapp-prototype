BaseView = require 'core/views/base'

module.exports = class SiteView extends BaseView

  el: '#site'

  regions:
    'content': '#content'
    'header': '#header'

  template: require './template'
