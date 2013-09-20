{ ProjectCollection } = require 'app/models/project'

ProjectsView = require 'app/views/projects'

describe 'ProjectsView', ->

  beforeEach ->

    @collection = new ProjectCollection [
      id: 1
      name: 'Project 1'
    ,
      id: 2
      name: 'Project 2'
    ]

    @projectsView = new ProjectsView { @collection }

  it 'should render all items by default', ->

    @projectsView.$('.project').length.should.equal 2
    @projectsView.$el.should.contain 'Project 1'
