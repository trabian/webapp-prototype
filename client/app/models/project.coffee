{ BaseModel, BaseCollection } = require 'core/models/base'

{ TodoCollection } = require './todo'

class Project extends BaseModel

  resourceName: 'projects'

  # If an ID is present, URL is /projects/[id]. Otherwise we are creating a
  # new project so use /projects
  urlRoot: '/projects'

  relations: [
    key: 'todos'
    collectionType: TodoCollection
  ]

class ProjectCollection extends BaseCollection

  model: Project

module.exports = { Project, ProjectCollection }
