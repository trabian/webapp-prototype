describe 'The HelloView', ->

  it 'should render the message', ->

    HelloView = require 'app/views/hello'

    message = 'Hi.'

    helloView = new HelloView
      message: message

    helloView.$el.should.contain message
