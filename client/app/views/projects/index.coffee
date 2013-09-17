BaseCollectionView = require 'core/views/base/collection'

module.exports = class ProjectListView extends BaseCollectionView

  itemView: require './project'
