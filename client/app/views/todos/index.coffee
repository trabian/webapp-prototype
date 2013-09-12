BaseCollectionView = require 'app/views/base/collection'

module.exports = class TodosView extends BaseCollectionView

  itemView: require './todo'
