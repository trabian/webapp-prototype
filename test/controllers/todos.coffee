TodosController = require 'app/controllers/todos'

describe 'TodosController', ->

  describe 'index action', ->

    beforeEach ->

      @controller = new TodosController

      @controller.beforeAction()
      @controller.index()

    it 'should create a TodosView', ->

      TodoView = require 'app/views/todos'

      @controller.view.should.be.an.instanceof TodoView

    it 'should set a collection on the view', ->

      @controller.view.collection.should.be.ok

    it 'should add the view to the "content" region', ->

      @controller.view.region.should.equal 'content'
