describe 'Sample', ->

  it 'should allow referencing a CommonJS module', ->

    HelloView = require 'app/views/hello'

    helloView = new HelloView
      message: 'Hi.'

    helloView.$el.should.contain 'Hi.'
