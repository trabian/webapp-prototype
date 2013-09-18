{ BaseModel, BaseCollection } = require 'core/models/base'

{ TodoCollection } = require './todo'

{ Person } = require './person'

class Project extends BaseModel

  resourceName: 'projects'

  # If an ID is present, URL is /projects/[id]. Otherwise we are creating a
  # new project so use /projects
  urlRoot: '/projects'

  relations: [
    type: 'HasMany'
    key: 'todos'
    collectionType: TodoCollection
  ,
    type: 'HasOne'
    key: 'owner'
    relatedModel: Person
  ]

class ProjectCollection extends BaseCollection

  model: Project

module.exports = { Project, ProjectCollection }
