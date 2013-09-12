BaseView = require 'app/views/base'

module.exports = class SiteView extends BaseView

  el: '#main'

  regions:
    'content': '#content'

  template: require './template'
