;(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var $, Backbone, sample;

sample = require('./sample');

$ = require('jquery');

Backbone = require('backbone');

Backbone.$ = $;

sample.run();

/*
//@ sourceMappingURL=index.js.map
*/
},{"./sample":2}],2:[function(require,module,exports){
var Backbone;

Backbone = require('backbone');

module.exports = {
  run: function() {
    return console.warn('SAMPLE', Backbone.$('body'));
  }
};

/*
//@ sourceMappingURL=index.js.map
*/
},{}]},{},[1,2])
//@ sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlcyI6WyIvVXNlcnMvbWF0dGRlYW4vZGV2L2xlYXJuaW5nL2dydW50L3dlYmFwcC8udG1wL2pzL2luZGV4LmpzIiwiL1VzZXJzL21hdHRkZWFuL2Rldi9sZWFybmluZy9ncnVudC93ZWJhcHAvLnRtcC9qcy9zYW1wbGUvaW5kZXguanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IjtBQUFBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUNkQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSIsInNvdXJjZXNDb250ZW50IjpbInZhciAkLCBCYWNrYm9uZSwgc2FtcGxlO1xuXG5zYW1wbGUgPSByZXF1aXJlKCcuL3NhbXBsZScpO1xuXG4kID0gcmVxdWlyZSgnanF1ZXJ5Jyk7XG5cbkJhY2tib25lID0gcmVxdWlyZSgnYmFja2JvbmUnKTtcblxuQmFja2JvbmUuJCA9ICQ7XG5cbnNhbXBsZS5ydW4oKTtcblxuLypcbi8vQCBzb3VyY2VNYXBwaW5nVVJMPWluZGV4LmpzLm1hcFxuKi8iLCJ2YXIgQmFja2JvbmU7XG5cbkJhY2tib25lID0gcmVxdWlyZSgnYmFja2JvbmUnKTtcblxubW9kdWxlLmV4cG9ydHMgPSB7XG4gIHJ1bjogZnVuY3Rpb24oKSB7XG4gICAgcmV0dXJuIGNvbnNvbGUud2FybignU0FNUExFJywgQmFja2JvbmUuJCgnYm9keScpKTtcbiAgfVxufTtcblxuLypcbi8vQCBzb3VyY2VNYXBwaW5nVVJMPWluZGV4LmpzLm1hcFxuKi8iXX0=
;