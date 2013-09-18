ProjectItemView = require 'app/views/projects/list_item'

{ Project } = require 'app/models/project'

describe 'ProjectView', ->

  it 'should display and bind to the project name', ->

    project = new Project
      name: 'My Project'

    projectView = new ProjectItemView
      model: project

    projectView.$el.should.contain 'My Project'

    project.set
      name: 'My New Name'

    projectView.$el.should.have 'a'

    projectView.$('a').should.contain 'My New Name'

