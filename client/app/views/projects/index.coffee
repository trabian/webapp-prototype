BaseCollectionView = require 'core/views/base/collection'

module.exports = class ProjectListView extends BaseCollectionView

  itemView: require './list_item'

  listSelector: '.list-group'

  template: require './template'
