BaseCollectionView = require 'core/views/base/collection'

module.exports = class TodosView extends BaseCollectionView

  className: 'todos'

  itemView: require './todo'

  listSelector: '.list-group'

  template: require './template'
