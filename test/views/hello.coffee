describe 'The HelloView', ->

  it 'should render the message', ->

    HelloView = require 'app/views/hello'

    helloView = new HelloView
      message: 'Hi.'

    helloView.$el.should.contain 'Hi.'
