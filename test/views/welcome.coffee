describe 'The WelcomeView', ->

  beforeEach ->

    WelcomeView = require 'app/views/welcome'

    @message = 'Hi.'

    @welcomeView = new WelcomeView
      message: @message

  it 'should render the message', ->
    @welcomeView.$el.should.contain @message
