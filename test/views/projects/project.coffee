ProjectView = require 'app/views/projects/project'

{ Project } = require 'app/models/project'

describe 'ProjectView', ->

  it 'should display and bind to the project name', ->

    project = new Project
      name: 'My Project'

    projectView = new ProjectView
      model: project

    projectView.$el.should.contain 'My Project'

    project.set
      name: 'My New Name'

    projectView.$el.should.contain 'My New Name'

