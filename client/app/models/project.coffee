Chaplin = require 'chaplin'

class Project extends Chaplin.Model

  # If an ID is present, URL is /projects/[id]. Otherwise we are creating a
  # new project so use /projects
  urlRoot: '/projects'

  # For individual project requests the data will be returned as the only
  # element of an array at `projects`:
  # {
  #   projects: [
  #     ... project info ...
  #   ]
  # }
  #
  # When the `parse` method is called by a collection to parse the individual
  # models in the collection the `resp` parameter will contain the unwrapped
  # model data.
  parse: (resp) ->
    resp.projects?[0] or resp

class ProjectCollection extends Chaplin.Collection

  url: '/projects'

  model: Project

  parse: (resp) ->
    resp.projects

module.exports = { Project, ProjectCollection }
