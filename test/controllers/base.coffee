BaseController = require 'app/controllers/base'

describe 'BaseController', ->

  it 'should compose a "site"', ->

    controller = new BaseController

    controller.beforeAction()

    controller.compose('site').should.be.ok
