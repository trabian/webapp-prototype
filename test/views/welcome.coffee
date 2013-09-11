describe 'The WelcomeView', ->

  it 'should render the message', ->

    WelcomeView = require 'app/views/welcome'

    message = 'Hi.'

    welcomeView = new WelcomeView
      message: message

    welcomeView.$el.should.contain message
