ProjectView = require 'app/views/projects/detail'

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

  it 'should show the related todos', ->

    project = new Project
      name: 'My Project'
      todos: [
        id: 1
        title: 'My Todo'
      ,
        id: 2
        title: 'My Other Todo'
      ]

    projectView = new ProjectView
      model: project

    projectView.$el.should.contain 'My Todo'

    projectView.$('.todo').length.should.equal 2
