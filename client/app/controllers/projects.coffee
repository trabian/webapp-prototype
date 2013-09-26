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

    project.fetch()

    @view = new ProjectDetailView
      model: project
      region: 'content'
      loadingText: 'Loading project details...'
      promise: project.pipe ->

        if owner = project.get 'owner'

          # If the owner hasn't been fetched then do so
          if owner.get 'name'
            owner.resolve()
          else
            owner.fetch()

          # The owner is a deferred, so the promise passed to the view will
          # not be considered fulfilled until the owner is fulfilled.
          return owner
