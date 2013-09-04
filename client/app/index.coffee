Application = require './application'

app = new Application
  routes: require './routes'
  controllerPath: 'app/controllers/'
  controllerSuffix: ''
