BaseController = require './base'

{ ProjectCollection } = require 'app/models/project'

ProjectListView = require 'app/views/projects'

module.exports = class ProjectsController extends BaseController

  tab: 'projects'

  index: ->

    collection = new ProjectCollection()

    collection.fetch()

    @view = new ProjectListView
      collection: collection
      region: 'content'
