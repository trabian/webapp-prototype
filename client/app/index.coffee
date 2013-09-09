Application = require './application'

new Application
  routes: require './routes'
  controllerPath: 'app/controllers/'
  controllerSuffix: ''
