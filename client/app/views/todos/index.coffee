Chaplin = require 'chaplin'

module.exports = class TodoListView extends Chaplin.CollectionView

  animationDuration: 0

  itemView: require './todo'
