# Webapp Prototype

This is a prototype of a client-side web application used to both demonstrate and explore ideas.

The stack consists of:

 * [Backbone](http://backbonejs.org/) and [Chaplin](http://chaplinjs.org/) as the JavaScript architecture.
 * [Compass](http://compass-style.org/) as the CSS authoring framework.
 * [Grunt](http://gruntjs.com/) as a task runner for build-related tasks.
 * [Bower](http://bower.io/) for client-side package management.
 * [Karma](http://karma-runner.github.io/0.10/index.html), [mocha](http://visionmedia.github.io/mocha/), and [Chai](http://chaijs.com/) for testing.

# Getting Started

## Clone the repository

```
git clone https://github.com/trabian/webapp-prototype.git
cd webapp-prototype
```

## Install global dependencies

The following dependencies are needed to run this prototype but are usually available globally on a development machine. If not, use the installation instructions provided.

### [Bundler](http://bundler.io/)

Used for managing Ruby dependencies. This assumes that ruby and rubygems are already installed, which is a safe assumption on OS X but can be installed on other environments using the instructions at [https://www.ruby-lang.org/en/downloads/](https://www.ruby-lang.org/en/downloads/).  You may need to use sudo (for OSX, *nix, BSD etc) or run your command shell as Administrator (for Windows) to do this.

```
gem install bundler

# Or, if that throws a permissions error:
sudo gem install bundler
```

### npm (via [Node](http://nodejs.org/))

**If node is already installed on your system, make sure you have at least version 0.10.x by running `node --version`.** If you want to keep multiple versions of node then you may want to checkout [nodeenv](https://github.com/wfarr/nodenv) or [n](https://github.com/visionmedia/n).

Used for managing JavaScript dependencies. The easiest way to install Node on OS X is through [Homebrew](http://brew.sh/).

```
brew install node
```

### Grunt (grunt-cli)

This will add the `grunt` command to your system path. Note that the grunt module is not installed here -- `grunt-cli` uses the grunt module included in each individual package. You may need to use sudo (for OSX, *nix, BSD etc) or run your command shell as Administrator (for Windows) to do this.

```
npm install -g grunt-cli
```

### Redis (optional)

[Redis](http://redis.io/) must be installed and running to use the [BrowserifyNavigation](https://github.com/trabian/BrowserifyNavigation) plugin through SublimeText. This is also most easily installed using Homebrew on OS X. Follow the instructions provided at the completion of the installation to start Redis and have it start automatically on startup.

```
brew install redis
```

## Install local dependencies

The webapp prototype includes node dependencies and ruby depencies (for Compass support). These dependencies should be installed from within the project directory:

### npm (Node) modules

Note: This may take a minute depending on the speed of your Internet connection.

```
npm install
```

### Ruby gems (via Bundler)

```
bundle install
```

## Verifying installation

### Run tests

The easiest way to verify the installation is to run `grunt test` from within the project directory. If this returns an error then [report an issue](https://github.com/trabian/webapp-prototype/issues) and we'll investigate.

### Run server and launch within browser

To run the development server and launch the app within a browser, run `grunt server`. This should build the JavaScript and CSS files, start a web server on port 9001, and launch a browser pointing at http://localhost:9001. If not, please [report an issue](https://github.com/trabian/webapp-prototype/issues).

# Development

The source code for the application is within the `client` directory. The JavaScript app is within `client/app` and the SASS files are in `client/sass`.

The easiest way to develop and explore using the prototype is to run `grunt server` before making any changes. This will ensure that your changes are visible within the browser (they'll even livereload when changes are made!) and that tests are run after each change.

