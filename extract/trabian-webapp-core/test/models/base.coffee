{ BaseModel, BaseCollection } = require 'core/models/base'

describe 'Base model', ->

  describe 'parse', ->

    beforeEach ->

      class Project extends BaseModel

        resourceName: 'projects'

      @project = new Project

    it 'should look for a single-element array scoped by the resourceName of the model', ->

      parsedData = @project.parse
        projects: [
          id: 1
          name: 'Test Name'
        ]

      parsedData.should.deep.equal
        id: 1
        name: 'Test Name'

    it 'should handle the case where a non-scoped response is parsed (for instance, when being parsed by the collection)', ->

      parsedData = @project.parse
        id: 1
        name: 'Test Name'

      parsedData.should.deep.equal
        id: 1
        name: 'Test Name'

    it "shouldn't bomb on empty data", ->

      parsedData = @project.parse()

      expect(parsedData).to.be.undefined

  describe 'event extensions', ->

    it 'should support onAndTrigger', (done) ->

      class Project extends BaseModel

      project = new Project

      project.onAndTrigger 'someEvent', ->
        done()

    it 'should support listenToAndTrigger', (done) ->

      class Project extends BaseModel

      class Todo extends BaseModel

      project = new Project

      todo = new Todo

      project.listenToAndTrigger todo, 'someEvent', ->
        this.should.equal project
        done()

describe 'Base collection', ->

  describe 'parse', ->

    beforeEach ->

      class Project extends BaseModel

        resourceName: 'projects'

      class ProjectCollection extends BaseCollection

        resourceName: 'projects'

        model: Project

      @projects = new ProjectCollection

    it 'should look for an array scoped by the resourceName of the collection', ->

      parsedData = @projects.parse
        projects: [
          id: 1
          name: 'Project 1'
        ,
          id: 2
          name: 'Project 2'
        ]

      parsedData.should.have.length 2

      parsedData[0].should.deep.equal
        id: 1
        name: 'Project 1'

      parsedData[1].should.deep.equal
        id: 2
        name: 'Project 2'

    it 'should fall back to a non-scoped array', ->

      parsedData = @projects.parse [
        id: 1
        name: 'Project 1'
      ,
        id: 2
        name: 'Project 2'
      ]

      parsedData.should.have.length 2

      parsedData[0].should.deep.equal
        id: 1
        name: 'Project 1'

      parsedData[1].should.deep.equal
        id: 2
        name: 'Project 2'

  describe 'resourceName', ->

    it 'should inherit from the model if not overridden', ->

      class Project extends BaseModel

        resourceName: 'projects'

      class ProjectCollection extends BaseCollection

        model: Project

      (new ProjectCollection).resourceName().should.equal 'projects'

    it 'should use a static property if provided', ->

      class Project extends BaseModel

        resourceName: 'projects'

      class ProjectCollection extends BaseCollection

        resourceName: 'myProjects'

        model: Project

      (new ProjectCollection).resourceName.should.equal 'myProjects'

  describe 'url', ->

    it "should use the model's urlRoot if not overridden", ->

      class Project extends BaseModel

        urlRoot: '/projects'

      class ProjectCollection extends BaseCollection

        model: Project

      (new ProjectCollection).url().should.equal '/projects'

  describe 'event extensions', ->

    it 'should support onAndTrigger', (done) ->

      class ProjectCollection extends BaseCollection

      projectCollection = new ProjectCollection

      projectCollection.onAndTrigger 'someEvent', ->
        done()

    it 'should support listenToAndTrigger', (done) ->

      class ProjectCollection extends BaseCollection

      class Todo extends BaseModel

      projectCollection = new ProjectCollection

      todo = new Todo

      projectCollection.listenToAndTrigger todo, 'someEvent', ->
        this.should.equal projectCollection
        done()
