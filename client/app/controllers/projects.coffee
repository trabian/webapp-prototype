BaseController = require './base'

{ Project, ProjectCollection } = require 'app/models/project'

ProjectListView = require 'app/views/projects'
ProjectDetailView = require 'app/views/projects/detail'

module.exports = class ProjectsController extends BaseController

  tab: 'projects'

  index: ->

    collection = new ProjectCollection()

    collection.fetch()

    @view = new ProjectListView
      collection: collection
      region: 'content'

  show: (params) ->

    project = new Project
      id: params.id

    project.fetch().done ->

      if owner = project.get 'owner'

        unless owner.get 'name'
          owner.fetch()

    @view = new ProjectDetailView
      model: project
      region: 'content'
